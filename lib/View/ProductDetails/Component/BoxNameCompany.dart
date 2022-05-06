import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';

class BoxNameCompany extends StatelessWidget {
  final String name;
  const BoxNameCompany({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: ColorApp.boxProduct(context),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          // CircleAvatar(),
          SizedBox(width: 10),
          An.text("$name", size: fontSizeSubTitle),
        ],
      ),
    );
  }
}
