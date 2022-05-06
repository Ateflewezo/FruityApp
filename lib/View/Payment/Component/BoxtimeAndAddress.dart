import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';

Widget buildContainer(BuildContext context,
    {String title, subTitle, Function onTap, IconData icon}) {
  return new Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.blueGrey.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorApp.searchBox(context))),
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 30),
                    const SizedBox(width: 5),
                    An.text("$title",
                        size: fontSizeTitle, fontWeight: FontWeight.bold),
                  ],
                ),
                const SizedBox(height: 15),
                An.text("$subTitle",
                    size: fontSizePrice, color: ColorApp.subTitle(context)),
              ],
            ),
          ),
        ),
        // IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios_outlined)),
      ],
    ),
  );
}

Widget buildContainerInfo(BuildContext context,
    {String title, subTitle, Function onTap, IconData icon}) {
  return new Container(
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
    decoration: BoxDecoration(
        color: Colors.blueGrey.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorApp.searchBox(context))),
    child: Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, size: 30),
                    const SizedBox(width: 5),
                    An.text("$title",
                        size: fontSizeTitle, fontWeight: FontWeight.bold),
                  ],
                ),
                const SizedBox(height: 15),
                An.text("$subTitle",
                    size: fontSizePrice, color: ColorApp.subTitle(context)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
