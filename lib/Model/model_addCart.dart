

class ModelAddCart {

  ModelAddCart({
    this.macAddress,
    this.productId,
    this.quantity,
    this.price,
    this.orderFeature,
  });

  String macAddress;
  int productId;
  int quantity;
  int price;
  List<OrderFeature> orderFeature;

  factory ModelAddCart.fromJson(Map<String, dynamic> json) => ModelAddCart(
        macAddress: json["mac_address"],
        productId: json["product_id"],
        quantity: json["quantity"],
        price: json["price"],
        orderFeature: List<OrderFeature>.from(
            json["order_feature"].map((x) => OrderFeature.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mac_address": macAddress,
        "product_id": productId,
        "quantity": quantity,
        "price": price,
        "order_feature": List<dynamic>.from(orderFeature.map((x) => x.toJson())),
      };
}

class OrderFeature {
  OrderFeature({
    this.featureId,
    this.optionId,
    this.title,
    this.price,
  });

  int featureId;
  int optionId;
  int title;
  int price;

  factory OrderFeature.fromJson(Map<String, dynamic> json) => OrderFeature(
        featureId: json["feature_id"],
        optionId: json["option_id"],
        title: json["title"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "feature_id": featureId,
        "option_id": optionId,
        "title": title,
        "price": price,
      };
}
