import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import '/Controller/Controller_Country.dart';

class changeLangApp extends StatelessWidget {
  final Color color;
  const changeLangApp({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ControllerCountry controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        An.text("Chooselanguage".tr, size: fontSizeTitle),
        SizedBox(height: 10),
        new Container(
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(10)),
          child: GetBuilder<ControllerCountry>(
            builder: (logic) {
              return Column(
                children: [
                  RadioListTile(
                      title: An.text("اللغة العربية", size: fontSizeTitle),
                      value: 1,
                      activeColor: color,
                      groupValue: controller.values,
                      onChanged: (value) {
                        controller.onChanged1(context, value);
                        Get.find<ControllerHomeApp>().changeArabic(context);
                      }),
                  Divider(),
                  RadioListTile(
                      title: An.text("English", size: fontSizeTitle),
                      value: 2,
                      activeColor: color,
                      groupValue: controller.values,
                      onChanged: (value) {
                        controller.onChanged2(context, value);
                        Get.find<ControllerHomeApp>().changeEnglish(context);
                      }),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
