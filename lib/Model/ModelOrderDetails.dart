import 'dart:convert';

ModelOrderDetails modelOrderDetailsFromJson(String str) => ModelOrderDetails.fromJson(json.decode(str));

String modelOrderDetailsToJson(ModelOrderDetails data) =>
    json.encode(data.toJson());

class ModelOrderDetails {
  ModelOrderDetails({
    this.status,
    this.data,
    this.message,
  });

  String status;
  Data data;
  String message;

  factory ModelOrderDetails.fromJson(Map<String, dynamic> json) =>
      ModelOrderDetails(
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
    this.info,
    this.deliveryInfo,
    this.products,
  });

  InfoOrder info;
  DeliveryInfo deliveryInfo;
  List<ProductOrder> products;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        info: InfoOrder.fromJson(json["info"]),
        deliveryInfo: DeliveryInfo.fromJson(json["delivery_info"]),
        products: List<ProductOrder>.from(
            json["products"].map((x) => ProductOrder.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "delivery_info": deliveryInfo.toJson(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class DeliveryInfo {
  DeliveryInfo({
    this.orderArrivalDate,
    this.orderArrivalTimeFrom,
    this.orderArrivalTimeTo,
    this.mobile,
    this.address,
  });

  String orderArrivalDate;
  String orderArrivalTimeFrom;
  String orderArrivalTimeTo;
  String mobile;
  String address;

  factory DeliveryInfo.fromJson(Map<String, dynamic> json) => DeliveryInfo(
        orderArrivalDate: json["order_arrival_date"],
        orderArrivalTimeFrom: json["order_arrival_time_from"],
        orderArrivalTimeTo: json["order_arrival_time_to"],
        mobile: json["mobile"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "order_arrival_date": orderArrivalDate,
        "order_arrival_time_from": orderArrivalTimeFrom,
        "order_arrival_time_to": orderArrivalTimeTo,
        "mobile": mobile,
        "address": address,
      };
}

class InfoOrder {
  InfoOrder({
    this.orderNumber,
    this.orderCreated,
    this.status,
    this.paymentMethod,
    this.total,
  });

  String orderNumber;
  String orderCreated;
  String status;
  String paymentMethod;
  double total;

  factory InfoOrder.fromJson(Map<String, dynamic> json) => InfoOrder(
        orderNumber: json["order_number"],
        orderCreated: json["order_created"],
        status: json["status"],
        paymentMethod: json["payment_method"],
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "order_number": orderNumber,
        "order_created": orderCreated,
        "status": status,
        "payment_method": paymentMethod,
        "total": total,
      };
}

class ProductOrder {
  ProductOrder({
    this.name,
    this.price,
    this.quantity,
    this.feature,
    this.imagePath,
  });

  String name;
  String price;
  String quantity;
  String feature;
  String imagePath;

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        feature: json["feature"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "quantity": quantity,
        "feature": feature,
        "imagePath": imagePath,
      };
}
