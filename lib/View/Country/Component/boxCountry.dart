import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';

class BoxCountry extends StatelessWidget {
  final Color color;
  const BoxCountry({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        An.text("Choosecountry".tr, size: fontSizeTitle),
        new Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              color: Colors.blueGrey[50],
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              new ListTile(
                title: An.text("Kuwait".tr, size: fontSizeTitle),
                leading: CircleAvatar(
                    child: SvgPicture.asset("assets/images/kuwait.svg")),
                trailing: Radio(
                  activeColor: color,
                  onChanged: (value) {},
                  groupValue: null,
                  value: null,
                ),
              ),
              Divider(height: 30),
              new ListTile(
                title: An.text("Egypt".tr, size: fontSizeTitle),
                leading: CircleAvatar(
                    child: SvgPicture.asset("assets/images/egypt.svg")),
              ),
              Divider(height: 30),
              new ListTile(
                title: An.text("SaudiArabia".tr, size: fontSizeTitle),
                leading: CircleAvatar(
                  child: Image.asset("assets/images/saudi.png"),
                ),
              ),
              Divider(height: 30),
              new ListTile(
                title: An.text("Morocco".tr, size: fontSizeTitle),
                leading: CircleAvatar(
                  child: Image.asset("assets/images/kisspng.png"),
                ),
              ),
              Divider(height: 30),
              new ListTile(
                title: An.text("Emirates".tr, size: fontSizeTitle),
                leading: CircleAvatar(
                  child: Image.asset("assets/images/UAE.png"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
