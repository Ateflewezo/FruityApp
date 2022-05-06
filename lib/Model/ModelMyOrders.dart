import 'dart:convert';

ModelMyOrders modelMyOrdersFromJson(String str) =>
    ModelMyOrders.fromJson(json.decode(str));

String modelMyOrdersToJson(ModelMyOrders data) => json.encode(data.toJson());

class ModelMyOrders {
  ModelMyOrders({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<DatumMyOrder> data;
  String message;

  factory ModelMyOrders.fromJson(Map<String, dynamic> json) => ModelMyOrders(
        status: json["status"],
        data: List<DatumMyOrder>.from(json["data"].map((x) => DatumMyOrder.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DatumMyOrder {
  DatumMyOrder({
    this.id,
    this.status,
    this.orderNumber,
    this.orderCreated,
    this.days,
    this.orderArrivalDate,
    this.orderArrivalTimeFrom,
    this.orderArrivalTimeTo,
    this.paymentMethod,
    this.total,
  });

  int id;
  String status;
  String orderNumber;
  String orderCreated;
  String days;
  DateTime orderArrivalDate;
  String orderArrivalTimeFrom;
  String orderArrivalTimeTo;
  String paymentMethod;
  double total;

  factory DatumMyOrder.fromJson(Map<String, dynamic> json) => DatumMyOrder(
        id: json["id"],
        status: json["status"],
        orderNumber: json["order_number"],
        orderCreated: json["order_created"],
        days: json["days"],
        orderArrivalDate: DateTime.parse(json["order_arrival_date"]),
        orderArrivalTimeFrom: json["order_arrival_time_from"],
        orderArrivalTimeTo: json["order_arrival_time_to"],
        paymentMethod: json["payment_method"],
        total: json["total"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "order_number": orderNumber,
        "order_created": orderCreated,
        "days": days,
        "order_arrival_date":
            "${orderArrivalDate.year.toString().padLeft(4, '0')}-${orderArrivalDate.month.toString().padLeft(2, '0')}-${orderArrivalDate.day.toString().padLeft(2, '0')}",
        "order_arrival_time_from": orderArrivalTimeFrom,
        "order_arrival_time_to": orderArrivalTimeTo,
        "payment_method": paymentMethod,
        "total": total,
      };

  contains(lowerCase) {}
}
