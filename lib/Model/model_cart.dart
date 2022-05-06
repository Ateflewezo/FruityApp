// To parse this JSON data, do
//
//     final modelCart = modelCartFromJson(jsonString);

import 'dart:convert';

ModelCart modelCartFromJson(String str) => ModelCart.fromJson(json.decode(str));

String modelCartToJson(ModelCart data) => json.encode(data.toJson());

class ModelCart {
  ModelCart({
    this.status,
    this.data,
    this.message,
  });

  String status;
  DataCart data;
  String message;

  factory ModelCart.fromJson(Map<String, dynamic> json) => ModelCart(
    status: json["status"],
    data: DataCart.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class DataCart {
  DataCart({
    this.orderInfo,
    this.products,
    this.totalPrice,
  });

  OrderInfo orderInfo;
  List<ProductsCart> products;
  String totalPrice;

  factory DataCart.fromJson(Map<String, dynamic> json) => DataCart(
    orderInfo: OrderInfo.fromJson(json["order_info"]),
    products: List<ProductsCart>.from(json["products"].map((x) => ProductsCart.fromJson(x))),
    totalPrice: json["TotalPrice"],
  );

  Map<String, dynamic> toJson() => {
    "order_info": orderInfo.toJson(),
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "TotalPrice": totalPrice,
  };
}

class OrderInfo {
  OrderInfo({
    this.id,
    this.counts,
  });

  int id;
  String counts;

  factory OrderInfo.fromJson(Map<String, dynamic> json) => OrderInfo(
    id: json["id"],
    counts: json["counts"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "counts": counts,
  };
}

class ProductsCart {
  ProductsCart({
    this.id,
    this.productId,
    this.imagePath,
    this.name,
    this.mainQuantity,
    this.quantity,
    this.price,
    this.mainprice,
    this.feature,
  });

  int id;
  int productId;
  String imagePath;
  String name;
  String mainQuantity;
  String quantity;
  String price;
  String mainprice;
  String feature;

  factory ProductsCart.fromJson(Map<String, dynamic> json) => ProductsCart(
    id: json["id"],
    productId: json["product_id"],
    imagePath: json["imagePath"],
    name: json["name"],
    mainQuantity: json["mainQuantity"],
    quantity: json["quantity"],
    price: json["price"],
    mainprice: json["mainprice"],
    feature: json["feature"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "imagePath": imagePath,
    "name": name,
    "mainQuantity": mainQuantity,
    "quantity": quantity,
    "price": price,
    "mainprice": mainprice,
    "feature": feature,
  };
}
