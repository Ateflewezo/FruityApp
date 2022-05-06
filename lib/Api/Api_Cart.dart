import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:fruity/Model/model_addCart.dart';
import 'package:fruity/Model/model_cart.dart';
import 'package:platform_device_id/platform_device_id.dart';
import '/Helper/Constants.dart';
import 'package:get/get.dart';

class ApiCart {
  //============== Fetch Api getCart ===========================================
  static Future<ModelCart> getCart() async {
    String deviceId = await PlatformDeviceId.getDeviceId;
    Map<String, String> headers = {
      "lang": Get.locale.languageCode,
      "Accept": "application/json"
    };
    Map<String, String> body = {"mac_address": "$deviceId"};
    try {
      var url = Uri.parse('$urlApi/get/cart');
      http.Response response =
          await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        var dataCart = ModelCart.fromJson(jsonDecode(response.body));
        return dataCart;
      } else {
        return null;
      }
    } catch (e) {
      // throw (e);
    }
  }

  //============== Fetch Api getCart ===========================================
  static Future<ModelAddCart> addProductToCart(Map body) async {
    try {
      var url = Uri.parse('$urlApi/add/cart');
      http.Response response = await http.post(url,
          headers: {
            "lang": Get.locale.languageCode,
            'content-type': 'application/json'
          },
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        var out = jsonDecode(response.body);
        if (out["message"] == " Done added product is successflly") {
          Get.find<ControllerCart>().doneAdd();
        }
      }
      return null;
    } catch (e) {
      throw e;
    }
  }

  //============== Fetch Api deleteCart ========================================
  static Future deleteCart({String productID, int index}) async {
    final url = Uri.parse('$urlApi/delete/cart');
    Map<String, dynamic> body = {
      "order_id": Get.find<ControllerCart>().orderInfo.id.toString(),
      "product_order_id": "$productID"
    };
    http.Response response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> out = jsonDecode(response.body);
      if (out['message'] == "deleted done!!" ||
          out['message'] == "cart is empty") {
        Get.find<ControllerCart>().cartList.removeAt(index);
      }
    } else {
      return null;
    }
  }

  //============== Fetch Api deleteCart ========================================
  static Future editCart({String productID, type}) async {
    final url = Uri.parse('$urlApi/edit/cart');
    Map<String, dynamic> body = {
      "product_order_id": "$productID",
      "type": "$type",
    };
    http.Response response = await http.post(url, body: body);
    if (response.statusCode == 200) {}
  }
}
