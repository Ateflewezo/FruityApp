import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/View/MyOrders/ScreenMyOrder.dart';

class ScreenDoneOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=====body====================================================
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //=====Box Image Dine=======================================
          new Container(
            margin: const EdgeInsets.only(bottom: 30),
            alignment: Alignment.center,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: ColorApp.searchBox(context),
            ),
            child: SvgPicture.asset("assets/images/doneorder.svg",
                width: 100, height: 100),
          ),

          An.text("OrderDone".tr,
              size: fontSizeTitle + 10, fontWeight: FontWeight.bold),
          An.text("YouFollow".tr,
              size: fontSizeSubTitle, color: ColorApp.subTitle(context)),
          const SizedBox(height: 10),

          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            width: An.widthQuery(),
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                border:
                    Border.all(width: 0.3, color: ColorApp.subTitle(context)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                buildRow(
                    name: "orderNumber".tr,
                    value: getSave.read(submitSave) == null
                        ? ""
                        : getSave.read(submitSave)["data"]["order_data"]
                            ["order_number"]),
                new Divider(height: 30),
                buildRow(
                    name: "OrderData".tr,
                    value: getSave.read(submitSave) == null
                        ? ""
                        : getSave.read(submitSave)["data"]["order_data"]
                            ["order_created"]),
                new Divider(height: 30),
                buildRow(
                    name: "totalFatoorah".tr,
                    value: getSave.read(submitSave) == null
                        ? ""
                        : getSave.read(submitSave)["data"]["order_data"]
                            ["total"]),
              ],
            ),
          ),

          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 10),
                Expanded(
                  child: An.buttonElevated(
                      name: "BackHome".tr,
                      fontFamily: fontFamily,
                      fontSize: fontSizeTitle,
                      radius: 10,
                      height: 60,
                      colorPrimary: ColorApp.primary(context),
                      onPressed: () => Get.offAllNamed(AppRoutes.homeNavBar)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Row buildRow({String name, value}) {
    return new Row(
      children: [
        An.text("$name : ", size: fontSizeTitle),
        const SizedBox(width: 20),
        An.text("$value", size: fontSizeTitle),
      ],
    );
  }
}
