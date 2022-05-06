import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';

class BoxTitlePrice extends StatelessWidget {
  const BoxTitlePrice({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      width: An.widthQuery(),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorApp.searchBox(context))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          An.text("fatoorahdetails".tr,
              size: fontSizeTitle, fontWeight: FontWeight.bold),
          const SizedBox(height: 20),
          _buildRow(context,
              name: "total".tr,
              price: getSave.read(confirmSave)["data"]["total"]),
          SizedBox(height: 10),
          _buildRow(context,
              name: "Deliveryprice".tr,
              price: getSave.read(confirmSave)["data"]["totaShippingCost"]),
          Divider(
            height: 30,
            color: ColorApp.primary(context),
            thickness: 2,
          ),
          _buildRow(context,
              name: "totalpayment".tr,
              price: getSave.read(confirmSave)["data"]["TotalPrice"]),
        ],
      ),
    );
  }
}

Widget _buildRow(BuildContext context, {String name, price}) {
  return new Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      An.text("$name", size: fontSizeTitle),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          An.text(
            "$price",
            size: fontSizeTitle,
            fontWeight: FontWeight.bold,
          ),
          An.text("kd".tr,
              size: fontSizeSubTitle, color: ColorApp.subTitle(context)),
        ],
      ),
    ],
  );
}
