import 'dart:convert';

ModelProduct modelProductFromJson(String str) =>
    ModelProduct.fromJson(json.decode(str));

String modelProductToJson(ModelProduct data) => json.encode(data.toJson());

class ModelProduct {
  ModelProduct({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory ModelProduct.fromJson(Map<String, dynamic> json) => ModelProduct(
        status: json["status"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  Data({
    this.product,
  });

  ProductData product;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        product: ProductData.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "product": product.toJson(),
      };
}

class ProductData {
  ProductData({
    this.id,
    this.name,
    this.categoryName,
    this.mainprice,
    this.discount,
    this.code,
    this.quantity,
    this.prefitPriceDiscount,
    this.status,
    this.descrption,
    this.isFavourite,
    this.images,
    this.likeCount,
    this.features,
    this.image,
  });

  int id;
  String name;
  String image;
  String categoryName;
  String mainprice;
  String discount;
  dynamic code;
  String quantity;
  String prefitPriceDiscount;
  String status;
  String descrption;
  bool isFavourite;
  List<Image> images;
  String likeCount;
  List<Feature> features;

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        id: json["id"],
        name: json["name"],
        categoryName: json["CategoryName"],
        mainprice: json["mainprice"],
        discount: json["discount"],
        code: json["code"],
        quantity: json["quantity"],
    image: json["image"],
        prefitPriceDiscount: json["prefit_price_discount"],
        status: json["status"],
        descrption: json["descrption"],
        isFavourite: json["is_favourite"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        likeCount: json["likeCount"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );


  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "CategoryName": categoryName,
        "mainprice": mainprice,
        "discount": discount,
        "code": code,
        "image": image,
        "quantity": quantity,
        "prefit_price_discount": prefitPriceDiscount,
        "status": status,
        "descrption": descrption,
        "is_favourite": isFavourite,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "likeCount": likeCount,
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
      };
}

class Feature {
  Feature({
    this.id,
    this.title,
    this.options,
  });

  int id;
  String title;
  List<Option> options;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        id: json["id"],
        title: json["title"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  Option({
    this.id,
    this.price,
    this.count,
    this.featureId,
    this.title,
  });

  int id;
  String price;
  String count;
  String featureId;
  String title;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        price: json["price"],
        count: json["count"],
        featureId: json["feature_id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "count": count,
        "feature_id": featureId,
        "title": title,
      };
}

class Image {
  Image({
    this.imagePath,
  });

  String imagePath;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
      };
}
