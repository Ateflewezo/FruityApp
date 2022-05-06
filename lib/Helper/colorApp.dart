import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';

class ColorApp {
  //=============== theme Colors App ======
  static scaffold(BuildContext context) =>
      Theme.of(context).scaffoldBackgroundColor;
  static title(BuildContext context) => Theme.of(context).canvasColor;
  static subTitle(BuildContext context) => Colors.blueGrey;
  static appBarSearch(BuildContext context) => Colors.blueGrey[50];
  static primary(BuildContext context) =>
      HexColor(Get.find<ControllerHomeApp>().info.color);
  static primaryWithOpacity(BuildContext context) =>
      HexColor(Get.find<ControllerHomeApp>().info.color).withOpacity(0.1);
  static primaryWithOpacit2(BuildContext context) =>
      HexColor(Get.find<ControllerHomeApp>().info.color).withOpacity(0.4);
  static off(BuildContext context) => Colors.red;
  static whiteColor(BuildContext context) => Colors.white;
  static blackColor(BuildContext context) => Colors.black;
  static searchBox(BuildContext context) => Colors.blueGrey[100];
  //============= favorite
  static favoriteTrue(BuildContext context) => Colors.amber[600];
  static favoriteFalse(BuildContext context) => Colors.blueGrey;
  static boxProduct(BuildContext context) =>
      Colors.blueGrey.shade50.withOpacity(0.9);
}
