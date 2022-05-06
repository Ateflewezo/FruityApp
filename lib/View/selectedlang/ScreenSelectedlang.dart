import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/View/Country/Component/boxCountry.dart';
import 'package:fruity/View/Country/Component/changeLang.dart';
import 'package:get/get.dart';
import 'package:fruity/View/onBoardingPage/on_boarding_view.dart';

class ScreenSelectedLang extends StatelessWidget {
  const ScreenSelectedLang({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              changeLangApp(),
              SizedBox(height: 40),
              // BoxCountry(),
              const SizedBox(height: 20),
              An.buttonElevated(
                  name: "go".tr,
                  fontFamily: fontFamily,
                  width: 200,
                  height: 60,
                  fontSize: fontSizeTitle,
                  radius: 20,
                  onPressed: () => Get.offAll(OnBoardingPage()))
            ],
          ),
        ),
      ),
    );
  }
}
