import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '/Model/model_category.dart';
import '/Model/model_home.dart';
import '/Helper/Constants.dart';
import 'package:get/get.dart';

class ApiHomeApp {
  //============== Api Home ==================
  static Future<ModelHome> fetchDataHome() async {
    var url = Uri.parse('$urlApi/main');
    http.Response response = await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      var dataHome =  ModelHome.fromJson(jsonDecode(response.body));
      return dataHome;
    } else {
      return null;
    }
  }

  //============== Api Category ==================
  static Future<ModelCategory> fetchDataCategory({int parent, id, page, PagingController pagingController}) async {
    var url = Uri.parse('$urlApi/mainCategory?parent_id=$parent&id=$id&page=$page');
    http.Response response = await http.get(url, headers: {"lang": Get.locale.languageCode});
    if (response.statusCode == 200) {
      final dateCat = ModelCategory.fromJson(jsonDecode(response.body));

      //================================================
      final meta = dateCat.data;
      if (meta.currentPage == meta.lastPage) {
        pagingController.appendLastPage(dateCat.data.data);
      } else {
        pagingController.appendPage(dateCat.data.data, page + 1);
      }
      //================================================

      return dateCat;
    } else {
      return null;
    }
  }


}
