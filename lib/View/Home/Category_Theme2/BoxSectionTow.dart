import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';

class BoxSectionTow extends StatelessWidget {
  final GestureTapCallback onTap;
  final String name, image;
  const BoxSectionTow({Key key, this.onTap, this.name, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 150,
            margin: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
            child: Column(
              children: [
                Container(
                  height: 110,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: An.cachedNetworkImage("$image")),
                ),
                An.text("$name",
                    size: fontSizeSubTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ],
            ),
          ),
          Container(
            height: 110,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                border: Border.all(width: 1, color: ColorApp.primary(context)),
                borderRadius: BorderRadius.circular(20)),
          ),
        ],
      ),
    );
  }
}
