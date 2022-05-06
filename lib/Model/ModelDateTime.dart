import 'dart:convert';

ModelDateTime modelDateTimeFromJson(String str) => ModelDateTime.fromJson(json.decode(str));

String modelDateTimeToJson(ModelDateTime data) => json.encode(data.toJson());

class ModelDateTime {
  ModelDateTime({
    this.status,
    this.data,
    this.message,
  });

  String status;
  List<DatumDate> data;
  String message;

  factory ModelDateTime.fromJson(Map<String, dynamic> json) => ModelDateTime(
    status: json["status"],
    data: List<DatumDate>.from(json["data"].map((x) => DatumDate.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DatumDate {
  DatumDate({
    this.id,
    this.date,
    this.day,
    this.disabled,
  });

  int id;
  String date;
  String day;
  String disabled;

  factory DatumDate.fromJson(Map<String, dynamic> json) => DatumDate(
    id: json["id"],
    date: json["date"],
    day: json["day"],
    disabled: json["disabled"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date":date,
    "day": day,
    "disabled": disabled,
  };
}
