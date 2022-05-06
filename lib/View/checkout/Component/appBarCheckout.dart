import 'package:flutter/material.dart';
import '/Helper/WidgetShareApp/Navigator.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';

Widget appBarCheckout(BuildContext context) {
  return AppBar(
    elevation: 0,
    title: An.text("ReceiptData".tr),
    backgroundColor:Colors.blueGrey.shade50.withOpacity(0.9),
     leading: SizedBox(),
    actions: [
      IconButton(
          onPressed: () => Go.pop(),
          icon: Icon(Icons.arrow_forward_ios, color: ColorApp.blackColor(context),
          ))
    ],
  );
}