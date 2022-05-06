import 'package:flutter/material.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';
import '/Helper/colorApp.dart';
import '../../../Controller/Controller_checkout.dart';
class BoxSection extends StatelessWidget {
  final String name;
  final IconData icon;
  final int pageColor;

  const BoxSection({Key key, this.name, this.icon, this.pageColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCheckout>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              minRadius: 23,
              backgroundColor: controller.pageChanged == pageColor
                  ? ColorApp.primary(context)
                  : Colors.blueGrey[300],
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(height: 5),
            An.text("$name",
                size: fontSizeSubTitle,
                color: controller.pageChanged == pageColor
                    ? Colors.black
                    : Colors.blueGrey)
          ],
        );
      },
    );
  }
}
