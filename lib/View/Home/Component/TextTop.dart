import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';

Container buildContainer(BuildContext context) {
  ControllerHomeApp controller = Get.find();
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    color: Colors.blueGrey[50],
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildRow(context: context, name: "${controller.info.ads[0]}"),
        _buildRow(context: context, name: "${controller.info.ads[1]}"),
        _buildRow(context: context, name: "${controller.info.ads[2]}"),
      ],
    ),
  );
}

Widget _buildRow({BuildContext context, String name}) {
  return new Row(
    children: [
      new Icon(
        Icons.verified_user,
        color: ColorApp.primary(context),
      ),
      SizedBox(width: 5),
      An.text("$name", size: fontSizePrice)
    ],
  );
}
