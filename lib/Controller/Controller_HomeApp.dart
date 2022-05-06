import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fruity/Api/Api_HomeApp.dart';
import 'package:fruity/Helper/ChangeLanguage/LocalizationService.dart';
import 'package:fruity/Model/model_home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ControllerHomeApp extends GetxController {
  Info info;
  var isLoading = true.obs;
  RxList<SliderData> slider = RxList<SliderData>();
  RxList<Cateories> categories = RxList<Cateories>();
  String nameCategories;
  Future futureApiHome;
  String logoApp;
  String token;

  //======== onInit ============================================================
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    futureApiHome = fetchApiHome().then((value) {
      getNameCategories(name: categories[0].name);
      logoApp = info.logo;
      nameCategories = categories[0].name;
    });

    // send Notification ISO ====
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    await messaging.getNotificationSettings();

    // get Device Token ====
    messaging.getToken().then((DeviceToken) {
      print(DeviceToken);
    });
  }

  //======== get Name Categories ===============================================
  void getNameCategories({String name}) {
    nameCategories = name;
    update();
  }

  //======== fetch Api Home ====================================================
  Future<void> fetchApiHome({bool load = true}) async {
    try {
      isLoading(load);
      var dataHome = await ApiHomeApp.fetchDataHome();
      slider.clear();
      categories.clear();
      if (dataHome != null) {
        info = dataHome.data.info;
        slider.assignAll(dataHome.data.slider);
        categories.assignAll(dataHome.data.cateories);
      } else
        return null;
    } finally {
      isLoading(false);
    }
  }

  //========change lang to Arabic===============================================
  void changeArabic(BuildContext context) {
    LocalizationService().changeLocale("Arabic");
    fetchApiHome(load: false).then((value) {
      nameCategories = categories[0].name;
    });
  }

  //========change lang to English==============================================
  void changeEnglish(BuildContext context) {
    LocalizationService().changeLocale("English");
    fetchApiHome(load: false).then((value) {
      nameCategories = categories[0].name;
      print(nameCategories);
    });
  }
}
