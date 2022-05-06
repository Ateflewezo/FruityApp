import 'dart:convert';

ModelCategory modelCategoryFromJson(String str) =>
    ModelCategory.fromJson(json.decode(str));

String modelCategoryToJson(ModelCategory data) => json.encode(data.toJson());

class ModelCategory {
  ModelCategory({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory ModelCategory.fromJson(Map<String, dynamic> json) => ModelCategory(
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
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<DatumProduct> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<DatumProduct>.from(
            json["data"].map((x) => DatumProduct.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class DatumProduct {
  DatumProduct({
    this.id,
    this.mainprice,
    this.discount,
    this.imagePath,
    this.prefitPriceDiscount,
    this.isFavourite,
    this.featureExist,
    this.name,
    this.stock,
    this.image,
  });

  int id;
  String mainprice;
  String discount;
  String imagePath;
  String prefitPriceDiscount;
  bool isFavourite;
  bool featureExist;
  String name;
  String image;
  int stock;

  factory DatumProduct.fromJson(Map<String, dynamic> json) {
    return DatumProduct(
      id: json["id"],
      mainprice: json["mainprice"],
      discount: json["discount"],
      imagePath: json["image_path"],
      prefitPriceDiscount: json["prefit_price_discount"],
      isFavourite: json["is_favourite"],
      featureExist: json["feature_exist"],
      name: json["name"],
      stock: json["stock"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "mainprice": mainprice,
        "discount": discount,
        "image_path": imagePath,
        "prefit_price_discount": prefitPriceDiscount,
        "is_favourite": isFavourite,
        "feature_exist": featureExist,
        "name": name,
        "stock": stock,
        "image": image,
      };
}
