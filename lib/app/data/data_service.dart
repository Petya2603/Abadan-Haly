import 'dart:convert';
import 'dart:io';
import 'package:haly/app/data/carpet_model.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class DataService {
  static const String _fileName = 'carpet_data.json';

  Future<String> get _imagesPath async {
    final directory = await getApplicationDocumentsDirectory();
    final imagesDirectory = Directory('${directory.path}/images');
    if (!await imagesDirectory.exists()) {
      await imagesDirectory.create(recursive: true);
    }
    return imagesDirectory.path;
  }

  Future<String> _downloadImage(String imageUrl) async {
    if (imageUrl.startsWith('http')) {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final fileName = imageUrl.split('/').last;
        final localPath = await _imagesPath;
        final file = File('$localPath/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        return file.path;
      } else {
        // print('Failed to download image: $imageUrl');
        return imageUrl;
      }
    }
    return imageUrl;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<File> writeCarpetData(String data) async {
    final file = await _localFile;
    return file.writeAsString(data);
  }

  Future<String> readCarpetData() async {
    final file = await _localFile;
    String contents = await file.readAsString();
    return contents;
  }

  Future<CarpetData> getCarpetData() async {
    final String jsonString = await readCarpetData();
    final data = await json.decode(jsonString);
    return CarpetData.fromJson(data);
  }

  Future<void> importDataFromApi({Function(double)? onProgress}) async {
    final response =
        await http.get(Uri.parse('https://carpet.sada-devs.com/api/sync'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      final allImageUrls = <String>{}; // Use a Set to store unique URLs

      // Collect all image URLs from categories
      if (jsonData.containsKey('categories')) {
        for (var category in jsonData['categories']) {
          if (category['image'] != null) {
            allImageUrls.add(category['image']);
          }
          if (category.containsKey('subcategories')) {
            for (var subcategory in category['subcategories']) {
              if (subcategory['image'] != null) {
                allImageUrls.add(subcategory['image']);
              }
            }
          }
        }
      }

      // Collect all image URLs from products
      if (jsonData.containsKey('products')) {
        for (var product in jsonData['products']) {
          if (product.containsKey('category') &&
              product['category']['image'] != null) {
            allImageUrls.add(product['category']['image']);
          }
          if (product.containsKey('subcategory') &&
              product['subcategory']['image'] != null) {
            allImageUrls.add(product['subcategory']['image']);
          }
          if (product.containsKey('figures')) {
            for (var figure in product['figures']) {
              if (figure['image'] != null) {
                allImageUrls.add(figure['image']);
              }
              if (figure.containsKey('colors')) {
                for (var color in figure['colors']) {
                  if (color['image'] != null) {
                    allImageUrls.add(color['image']);
                  }
                }
              }
            }
          }
        }
      }

      int downloadedCount = 0;
      final totalImages = allImageUrls.length;
      final downloadedImagePaths = <String, String>{};

      // Download images and report progress
      for (final imageUrl in allImageUrls) {
        final localPath = await _downloadImage(imageUrl);
        downloadedImagePaths[imageUrl] = localPath;
        downloadedCount++;
        if (onProgress != null) {
          onProgress(downloadedCount / totalImages);
        }
      }

      // Replace URLs with local paths in the JSON data
      if (jsonData.containsKey('categories')) {
        for (var category in jsonData['categories']) {
          if (category['image'] != null) {
            category['image'] = downloadedImagePaths[category['image']];
          }
          if (category.containsKey('subcategories')) {
            for (var subcategory in category['subcategories']) {
              if (subcategory['image'] != null) {
                subcategory['image'] =
                    downloadedImagePaths[subcategory['image']];
              }
            }
          }
        }
      }

      if (jsonData.containsKey('products')) {
        for (var product in jsonData['products']) {
          if (product.containsKey('category') &&
              product['category']['image'] != null) {
            product['category']['image'] =
                downloadedImagePaths[product['category']['image']];
          }
          if (product.containsKey('subcategory') &&
              product['subcategory']['image'] != null) {
            product['subcategory']['image'] =
                downloadedImagePaths[product['subcategory']['image']];
          }
          if (product.containsKey('figures')) {
            for (var figure in product['figures']) {
              if (figure['image'] != null) {
                figure['image'] = downloadedImagePaths[figure['image']];
              }
              if (figure.containsKey('colors')) {
                for (var color in figure['colors']) {
                  if (color['image'] != null) {
                    color['image'] = downloadedImagePaths[color['image']];
                  }
                }
              }
            }
          }
        }
      }

      await writeCarpetData(json.encode(jsonData));
    } else {
      throw Exception('Failed to load data from API');
    }
  }
}
