import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/Helper/Binding/MyBinding.dart';
import 'Helper/ChangeLanguage/LocalizationService.dart';
import 'Helper/ResponsiveWrapper.dart';
import 'Helper/routes/pages.dart';
import 'Helper/routes/routes.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

String intScreen;
const String favoriteBox = 'FavoriteList';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await GetStorage.init();
  intScreen = await GetStorage().read("intScreen");
  GetStorage().write("intScreen", 'done');
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Theme App =============================================================
      theme: ThemeData(
        fontFamily: "DroidSans",
      ),

      // GetX Bindings =========================================================
      initialBinding: MyBindings(),

      // ======= lang =======
      translations: LocalizationService(),
      locale: LocalizationService().getCurrentLocale(),
      fallbackLocale: Locale(
        'ar',
        'US',
      ),

      // responsiveWrapper =====================================================
      builder: (context, widget) => responsiveWrapper(context, widget),

      // builder: EasyLoading.init(),

      // App Routes  ===========================================================
      initialRoute:
          intScreen != 'done' ? AppRoutes.selectedLang : AppRoutes.homeNavBar,
      getPages: AppPage.pages,

      // builder: EasyLoading.init(),
    );
  }
}
