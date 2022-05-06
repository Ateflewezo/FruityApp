// To parse this JSON data, do
//
//     final modelTimeDelivery = modelTimeDeliveryFromJson(jsonString);

import 'dart:convert';

ModelTimeDelivery modelTimeDeliveryFromJson(String str) => ModelTimeDelivery.fromJson(json.decode(str));

String modelTimeDeliveryToJson(ModelTimeDelivery data) => json.encode(data.toJson());

class ModelTimeDelivery {
  ModelTimeDelivery({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<DataTimeDelivery> data;
  String message;

  factory ModelTimeDelivery.fromJson(Map<String, dynamic> json) => ModelTimeDelivery(
    status: json["status"],
    data: List<DataTimeDelivery>.from(json["data"].map((x) => DataTimeDelivery.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DataTimeDelivery {
  DataTimeDelivery({
    this.id,
    this.from,
    this.to,
  });

  int id;
  String from;
  String to;

  factory DataTimeDelivery.fromJson(Map<String, dynamic> json) => DataTimeDelivery(
    id: json["id"],
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to,
  };
}
