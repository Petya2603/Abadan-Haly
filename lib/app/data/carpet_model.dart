import 'dart:convert';

CarpetData carpetDataFromJson(String str) =>
    CarpetData.fromJson(json.decode(str));

String carpetDataToJson(CarpetData data) => json.encode(data.toJson());

class Contact {
  final int id;
  final String title;
  final String description;
  final String? link;
  final int position;
  final String icon;

  Contact({
    required this.id,
    required this.title,
    required this.description,
    this.link,
    required this.position,
    required this.icon,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        link: json["link"],
        position: json["position"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "link": link,
        "position": position,
        "icon": icon,
      };
}

class About {
  final String title;
  final String description;
  final List<String> images;

  About({
    required this.title,
    required this.description,
    required this.images,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
        title: json["title"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}

class CarpetData {
  final About about;
  final List<Category> categories;
  final List<Product> products;
  final List<Contact> contacts;

  CarpetData({
    required this.about,
    required this.categories,
    required this.products,
    required this.contacts,
  });

  factory CarpetData.fromJson(Map<String, dynamic> json) => CarpetData(
        about: About.fromJson(json["about"]),
        categories: json.containsKey('categories') && json['categories'] != null
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : [],
        products: json.containsKey('products') && json['products'] != null
            ? List<Product>.from(
                json["products"].map((x) => Product.fromJson(x)))
            : [],
        contacts: json.containsKey('contacts') && json['contacts'] != null
            ? List<Contact>.from(
                json["contacts"].map((x) => Contact.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "about": about.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
      };
}

class Category {
  final int id;
  final String name;
  final String image;
  final int position;
  final List<Subcategory>? subcategories;
  final List<int>? topSellingProductsIds;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.position,
    this.subcategories,
    this.topSellingProductsIds,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        position: json["position"],
        subcategories: json["subcategories"] == null
            ? []
            : List<Subcategory>.from(
                json["subcategories"]!.map((x) => Subcategory.fromJson(x))),
        topSellingProductsIds: json["top_selling_products_ids"] == null
            ? []
            : List<int>.from(json["top_selling_products_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "position": position,
        "subcategories": subcategories == null
            ? []
            : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
        "top_selling_products_ids": topSellingProductsIds == null
            ? []
            : List<dynamic>.from(topSellingProductsIds!.map((x) => x)),
      };
}

class Subcategory {
  final int id;
  final String name;
  final String image;

  Subcategory({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Product {
  final int id;
  final String code;
  final String description;
  final Category category;
  final Subcategory subcategory;
  final List<Attribute> attributes;
  final List<Figure> figures;

  Product({
    required this.id,
    required this.code,
    required this.description,
    required this.category,
    required this.subcategory,
    required this.attributes,
    required this.figures,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        code: json["code"],
        description: json["description"],
        category: Category.fromJson(json["category"]),
        subcategory: Subcategory.fromJson(json["subcategory"]),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        figures:
            List<Figure>.from(json["figures"].map((x) => Figure.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "description": description,
        "category": category.toJson(),
        "subcategory": subcategory.toJson(),
        "attributes": List<dynamic>.from(attributes.map((x) => x.toJson())),
        "figures": List<dynamic>.from(figures.map((x) => x.toJson())),
      };
}

class Attribute {
  final String name;
  final String value;

  Attribute({
    required this.name,
    required this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Figure {
  final int id;
  final String name;
  final String image;
  final List<CarpetColor> colors;
  final List<Size> sizes;

  Figure({
    required this.id,
    required this.name,
    required this.image,
    required this.colors,
    required this.sizes,
  });

  factory Figure.fromJson(Map<String, dynamic> json) => Figure(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        colors: List<CarpetColor>.from(
            json["colors"].map((x) => CarpetColor.fromJson(x))),
        sizes: List<Size>.from(json["sizes"].map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
        "sizes": List<dynamic>.from(sizes.map((x) => x.toJson())),
      };
}

class CarpetColor {
  final int id;
  final String name;
  final String hexCode;
  final String image;

  CarpetColor({
    required this.id,
    required this.name,
    required this.hexCode,
    required this.image,
  });

  factory CarpetColor.fromJson(Map<String, dynamic> json) => CarpetColor(
        id: json["id"],
        name: json["name"],
        hexCode: json["hex_code"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hex_code": hexCode,
        "image": image,
      };
}

class Size {
  final int id;
  final int height;
  final int width;
  final String measurementUnit;

  Size({
    required this.id,
    required this.height,
    required this.width,
    required this.measurementUnit,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json["id"],
        height: json["height"],
        width: json["width"],
        measurementUnit: json["measurement_unit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "height": height,
        "width": width,
        "measurement_unit": measurementUnit,
      };

  static fromHeight(int i) {}
}
