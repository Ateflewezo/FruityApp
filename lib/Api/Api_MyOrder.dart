import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Model/ModelMyOrders.dart';
import 'package:fruity/Model/ModelOrderDetails.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:get/get.dart';

class ApiMyOrder {
  //============== Fetch Api deleteCart ========================================
  static Future<ModelMyOrders> fetchMyOrder() async {
    String deviceId = await PlatformDeviceId.getDeviceId;
    final url = Uri.parse('$urlApi/ordersByMacAddress?mac_address=$deviceId');
    http.Response response =
        await http.get(url, headers: {'lang': Get.locale.languageCode});
    if (response.statusCode == 200) {
      var data = ModelMyOrders.fromJson(jsonDecode(response.body));
      return data;
    }
    return null;
  }

  //============== Fetch Api deleteCart ========================================
  static Future<ModelOrderDetails> fetchOrderDetails({int id}) async {
    String deviceId = await PlatformDeviceId.getDeviceId;
    final url = Uri.parse('$urlApi/Order-details/$id');
    http.Response response =
        await http.get(url, headers: {'lang': Get.locale.languageCode});
    if (response.statusCode == 200) {
      return ModelOrderDetails.fromJson(jsonDecode(response.body));
    }
    return null;
  }
}
