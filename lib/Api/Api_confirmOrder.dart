import 'dart:convert';
// import 'dart:js';
// export 'dart:js';
// import 'package:js/js.dart';

import 'package:http/http.dart' as http;
import 'package:fruity/Helper/WidgetShareApp/MyAwesomeDialog.dart';
import 'package:fruity/Model/ModelDateTime.dart';
import 'package:fruity/Model/ModelTimeDelivery.dart';
import '/Helper/routes/routes.dart';
import '/Model/ModelModelRegions.dart';
import '/Model/Modelgovernmnets.dart';
import '/View/DoneOrder/ScreenDoneOrder.dart';
import '/Model/ModelShippingWay.dart';
import '/Helper/Constants.dart';
import 'package:get/get.dart';
import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/services.dart';
// import 'package:provider/provider.dart';

class ApiConfirmOrder {
  //================== fetchShippingWay ========================
  static Future<ModelShippingWay> fetchShippingWay() async {
    var url = Uri.parse('$urlApi/shippingWay');
    http.Response response = await http.get(url);
    var data = modelShippingWayFromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return data;
    }
    return null;
  }

  //================== post confirmOrder ========================
  static Future postConfirmOrder(Map<String, dynamic> body) async {
    try {
      var url = Uri.parse('$urlApi/confirmOrder');
      http.Response response = await http
          .post(url, body: body, headers: {"lang": Get.locale.languageCode});
      if (response.statusCode == 200) {
        var jsonString = jsonDecode(response.body);
        getSave.write(confirmSave, jsonString);
        Get.toNamed(AppRoutes.payment);
      } else {
        Get.snackbar(response.body.toString(), response.body.toString());
      }
      return null;
    } finally {}
  }

  //================== post confirmOrder ========================
  static Future postSubmitOrder(Map<String, dynamic> body) async {
    try {
      var url = Uri.parse('$urlApi/submitOrder');
      http.Response response = await http.post(
        url,
        body: body,
      );

      if (response.statusCode == 200) {
        var decodedJson = json.decode(response.body);
        var jsonValue = json.decode(decodedJson['status']);
        if (jsonValue == false) {
          // var jsonsDataString = json.decode(decodedJson['message']); // toString of Response's body is assigned to jsonDataString
          // var _data = jsonDecode(jsonsDataString);
          MyDialog.checkedStoke(jsonDecode(response.body)['message']);
        } else {
          var jsonString = jsonDecode(response.body);
          // print(jsonString);
          getSave.write(submitSave, jsonString);
          Get.offAll(() => ScreenDoneOrder());
        }
      }
      return null;
    } finally {}
  }

  static Future<List<governmnetsData>> fetchData() async {
    var url = Uri.parse('$urlApi/governmnets');
    http.Response response =
        await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      var data = Modelgovernmnets.fromJson(jsonDecode(response.body));
      return data.data;
    } else {
      return null;
    }
  }

  static Future<List<DataRegions>> fetchRegions({int id}) async {
    var url = Uri.parse('$urlApi/governmnets/$id');
    http.Response response =
        await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      var data = ModelRegions.fromJson(jsonDecode(response.body));
      return data.data;
    } else {
      return null;
    }
  }

  static Future<List<DatumDate>> fetchDateDelivery({int id}) async {
    var url = Uri.parse('$urlApi/ArrivalDate');
    http.Response response =
        await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      var data = ModelDateTime.fromJson(jsonDecode(response.body));
      return data.data;
    } else {
      return null;
    }
  }

  static Future<List<DataTimeDelivery>> fetchTimeDelivery(
      {DateTime dateTime}) async {
    var url = Uri.parse(
        '$urlApi/ArrivalDateTime?date=${dateTime.toString().substring(0, 10)}');
    // var url = Uri.parse('$urlApi/ArrivalDateTime?date=12-12-2021');

    http.Response response =
        await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      var data = ModelTimeDelivery.fromJson(jsonDecode(response.body));
      return data.data;
    } else {
      return null;
    }
  }
}
