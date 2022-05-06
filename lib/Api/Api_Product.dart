import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fruity/Model/model_product.dart';
import '/Helper/Constants.dart';
import 'package:get/get.dart';

class ApiProduct {
  //============== Api Home ==================
  static Future<ModelProduct> fetchData(int id) async {
    var url = Uri.parse('$urlApi/product/$id');
    http.Response response =
        await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      return ModelProduct.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
