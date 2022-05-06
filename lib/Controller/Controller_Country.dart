import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllerCountry extends GetxController {
  int values = Get.locale.languageCode == "en" ? 2: 1;

  void onChanged1(BuildContext context, value) {
    values = value;
    update();
  }

  void onChanged2(BuildContext context, value) {
    values = value;
    update();
  }
}
