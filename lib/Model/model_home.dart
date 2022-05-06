class ModelHome {
  String status;
  Data data;
  String message;

  ModelHome({
      this.status, 
      this.data, 
      this.message});

  ModelHome.fromJson(dynamic json) {
    status = json["status"];
    data = json["data"] != null ? Data.fromJson(json["data"]) : null;
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = status;
    if (data != null) {
      map["data"] = data.toJson();
    }
    map["message"] = message;
    return map;
  }

}

class Data {
  Info info;
  List<SliderData> slider;
  List<Cateories> cateories;

  Data({
      this.info, 
      this.slider, 
      this.cateories});

  Data.fromJson(dynamic json) {
    info = json["info"] != null ? Info.fromJson(json["info"]) : null;
    if (json["slider"] != null) {
      slider = [];
      json["slider"].forEach((v) {
        slider.add(SliderData.fromJson(v));
      });
    }
    if (json["cateories"] != null) {
      cateories = [];
      json["cateories"].forEach((v) {
        cateories.add(Cateories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (info != null) {
      map["info"] = info.toJson();
    }
    if (slider != null) {
      map["slider"] = slider.map((v) => v.toJson()).toList();
    }
    if (cateories != null) {
      map["cateories"] = cateories.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cateories {
  int id;
  String name;
  int parentId;
  String imagePath;

  Cateories({
      this.id, 
      this.name, 
      this.parentId, 
      this.imagePath});

  Cateories.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
    parentId = json["parent_id"];
    imagePath = json["imagePath"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["parent_id"] = parentId;
    map["imagePath"] = imagePath;
    return map;
  }

}

class SliderData {
  int id;
  String imagePath;
  int showNumber;

  SliderData({
      this.id,
    this.showNumber,
      this.imagePath});

  SliderData.fromJson(dynamic json) {
    id = json["id"];
    imagePath = json["imagePath"];
    showNumber = json["showNumber"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["imagePath"] = imagePath;
    map["showNumber"] = showNumber;
    return map;
  }

}

class Info {
  String color;
  String categoryThem;
  String productThem;
  String logo;
  List<String> ads;


  Info(this.color, this.categoryThem, this.productThem, this.logo, this.ads);

  Info.fromJson(dynamic json) {
    color = json["color"];
    logo = json["logo"];
    categoryThem = json["category_them"];
    productThem = json["product_them"];
    ads = json["ads"] != null ? json["ads"].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["color"] = color;
    map["category_them"] = categoryThem;
    map["product_them"] = productThem;
    map["ads"] = ads;
    map["logo"] = logo;
    return map;
  }

}