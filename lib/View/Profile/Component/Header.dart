import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: ColorApp.primary(context)),
            ),
            // child: Image.network("src"),
          ),
          SizedBox(width: 20),
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              An.text("اسم الشركة", size: fontSizeTitle + 9),
              An.text("anwershehata@gmail.com",
                  size: fontSizeSubTitle, color: ColorApp.subTitle(context)),
            ],
          )
        ],
      ),
    );
  }
}
