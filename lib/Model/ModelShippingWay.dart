import 'dart:convert';

ModelShippingWay modelShippingWayFromJson(String str) =>
    ModelShippingWay.fromJson(json.decode(str));

String modelShippingWayToJson(ModelShippingWay data) =>
    json.encode(data.toJson());

class ModelShippingWay {
  ModelShippingWay({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<DatumShipping> data;
  String message;

  factory ModelShippingWay.fromJson(Map<String, dynamic> json) =>
      ModelShippingWay(
        status: json["status"],
        data: List<DatumShipping>.from(json["data"].map((x) => DatumShipping.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class DatumShipping {
  DatumShipping({
    this.id,
    this.name,
    this.type,
  });

  int id;
  String name;
  int type;

  factory DatumShipping.fromJson(Map<String, dynamic> json) => DatumShipping(
        id: json["id"],
        name: json["name"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
      };
}
