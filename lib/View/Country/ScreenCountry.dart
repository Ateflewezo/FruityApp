import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_Country.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'Component/boxCountry.dart';
import 'Component/changeLang.dart';

class ScreenCountry extends GetView<ControllerCountry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=====AppBar========================
      appBar: AppBar(
        title: An.text("البلد واللغة"),
        elevation: 0,
        backgroundColor: ColorApp.whiteColor(context),
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: ColorApp.blackColor(context),
              ))
        ],
      ),

      //=====body========================
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              changeLangApp(
                color: ColorApp.primary(context),
              ),
              SizedBox(height: 40),
              BoxCountry(
                color: ColorApp.primary(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
