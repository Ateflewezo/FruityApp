import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';

class NameSections extends StatelessWidget {
  final String name;
  const NameSections({Key key, this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: GetBuilder<ControllerHomeApp>(
      builder: (logic) {
        return Padding(
          padding:
              const EdgeInsets.only(left: 10, top: 25, right: 10, bottom: 5),
          child: An.text("$name",
              size: fontSizeTitle, fontWeight: FontWeight.bold),
        );
      },
    ));
  }
}
