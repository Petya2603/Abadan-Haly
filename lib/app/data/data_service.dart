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

  Future<void> importDataFromApi() async {
    final response =
        await http.get(Uri.parse('https://carpet.sada-devs.com/api/sync'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);

      // Process categories
      if (jsonData.containsKey('categories')) {
        for (var category in jsonData['categories']) {
          if (category.containsKey('image')) {
            category['image'] = await _downloadImage(category['image']);
          }
          if (category.containsKey('subcategories')) {
            for (var subcategory in category['subcategories']) {
              if (subcategory.containsKey('image')) {
                subcategory['image'] =
                    await _downloadImage(subcategory['image']);
              }
            }
          }
        }
      }

      // Process products
      if (jsonData.containsKey('products')) {
        for (var product in jsonData['products']) {
          if (product.containsKey('category') &&
              product['category'].containsKey('image')) {
            product['category']['image'] =
                await _downloadImage(product['category']['image']);
          }
          if (product.containsKey('subcategory') &&
              product['subcategory'].containsKey('image')) {
            product['subcategory']['image'] =
                await _downloadImage(product['subcategory']['image']);
          }
          if (product.containsKey('figures')) {
            for (var figure in product['figures']) {
              if (figure.containsKey('image')) {
                figure['image'] = await _downloadImage(figure['image']);
              }
              if (figure.containsKey('colors')) {
                for (var color in figure['colors']) {
                  if (color.containsKey('image')) {
                    color['image'] = await _downloadImage(color['image']);
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
