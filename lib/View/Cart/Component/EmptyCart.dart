import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 300,
              height: 200,
              child: SvgPicture.asset("assets/images/cartempty.svg")),
          SizedBox(height: 50),
          An.text("cartEmpty".tr, size: fontSizeTitle + 3),
          SizedBox(height: 10),
          SizedBox(
            width: 200,

            // child: An.buttonElevated(
            //     name: "تسوق الان👍",
            //     radius: 15,
            //     fontSize: fontSizeTitle,
            //     fontFamily: fontFamily,
            //     colorPrimary: ColorApp.primary(context),
            //     onPressed: () => Get.toNamed(AppRoutes.homeNavBar)
            // ),
          )
        ],
      ),
    );
  }
}
