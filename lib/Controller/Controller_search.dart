import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fruity/Model/ModelSearch.dart';

enum Status { loading, loaded, idle, error, empty }

class SearchController extends GetxController {
  Status status = Status.idle;
  List<DatumSearch> searchResults;
  final controller = TextEditingController();

  void clearResult() {
    controller.clear();
    update();
  }

  Future<void> search(String searchKey) async {
    try {
      searchResults = await apiGetSearch(searchKey);
      status = Status.loaded;
      update();
    } on EmptySearchResult catch (e) {
      status = Status.empty;
      update();
    } catch (e) {
      status = Status.error;
      update();
      // throw e;
    }
  }

  void onChanged(String value) {
    if (value.isEmpty) {
      status = Status.idle;
      update();
    } else {
      search(value);
    }
  }
}

Future<List<DatumSearch>> apiGetSearch(String searchKey) async {
  try {
    final response = await Dio().get(
        'https://store.masharia.co/api/search?search=$searchKey',
        options: Options(headers: {"lang": "ar"}));
    final data = response.data;
    if (data['status'] == 'false') {
      throw EmptySearchResult();
    }
    return ModelSearch.fromJson(response.data).data.data;
  } catch (e) {
    throw e;
  }
}

class EmptySearchResult implements Exception {}
