// To parse this JSON data, do
//
//     final modelgovernmnets = modelgovernmnetsFromJson(jsonString);

import 'dart:convert';

Modelgovernmnets modelgovernmnetsFromJson(String str) => Modelgovernmnets.fromJson(json.decode(str));

String modelgovernmnetsToJson(Modelgovernmnets data) => json.encode(data.toJson());

class Modelgovernmnets {
  Modelgovernmnets({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<governmnetsData> data;
  String message;

  factory Modelgovernmnets.fromJson(Map<String, dynamic> json) => Modelgovernmnets(
    status: json["status"],
    data: List<governmnetsData>.from(json["data"].map((x) => governmnetsData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class governmnetsData {
  governmnetsData({
    this.id,
    this.addressAddress,
    this.addressLatitude,
    this.addressLongitude,
    this.createdAt,
    this.updatedAt,
    this.countryId,
    this.name,
  });

  int id;
  String addressAddress;
  String addressLatitude;
  String addressLongitude;
  DateTime createdAt;
  DateTime updatedAt;
  String countryId;
  String name;

  factory governmnetsData.fromJson(Map<String, dynamic> json) => governmnetsData(
    id: json["id"],
    addressAddress: json["address_address"],
    addressLatitude: json["address_latitude"],
    addressLongitude: json["address_longitude"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    countryId: json["country_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address_address": addressAddress,
    "address_latitude": addressLatitude,
    "address_longitude": addressLongitude,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "country_id": countryId,
    "name": name,
  };
}
