import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';

class BoxSectionOne extends StatelessWidget {
  final GestureTapCallback onTap;
  final String name, image;
  const BoxSectionOne({Key key, this.onTap, this.name, this.image})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 130,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: An.cachedNetworkImage("$image"),
            ),
          ),
          Container(
            width: 130,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
          ),
          An.text("$name", color: Colors.white, size: fontSizeSubTitle),
        ],
      ),
    );
  }
}
