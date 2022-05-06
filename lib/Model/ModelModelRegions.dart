// To parse this JSON data, do
//
//     final modelRegions = modelRegionsFromJson(jsonString);

import 'dart:convert';

ModelRegions modelRegionsFromJson(String str) => ModelRegions.fromJson(json.decode(str));

String modelRegionsToJson(ModelRegions data) => json.encode(data.toJson());

class ModelRegions {
  ModelRegions({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<DataRegions> data;
  String message;

  factory ModelRegions.fromJson(Map<String, dynamic> json) => ModelRegions(
    status: json["status"],
    data: List<DataRegions>.from(json["data"].map((x) => DataRegions.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DataRegions {
  DataRegions({
    this.id,
    this.status,
    this.addressAddress,
    this.addressLatitude,
    this.addressLongitude,
    this.governmentsId,
    this.createdAt,
    this.updatedAt,
    this.countryId,
    this.name,
  });

  int id;
  String status;
  String addressAddress;
  String addressLatitude;
  String addressLongitude;
  String governmentsId;
  DateTime createdAt;
  DateTime updatedAt;
  String countryId;
  String name;

  factory DataRegions.fromJson(Map<String, dynamic> json) => DataRegions(
    id: json["id"],
    status: json["status"],
    addressAddress: json["address_address"],
    addressLatitude: json["address_latitude"],
    addressLongitude: json["address_longitude"],
    governmentsId: json["governments_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    countryId: json["country_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "address_address": addressAddress,
    "address_latitude": addressLatitude,
    "address_longitude": addressLongitude,
    "governments_id": governmentsId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "country_id": countryId,
    "name": name,
  };
}
