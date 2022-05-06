import 'package:flutter/material.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';

class MethodPayment extends StatelessWidget {
  const MethodPayment({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      decoration: BoxDecoration(
          color: ColorApp.appBarSearch(context),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorApp.searchBox(context))),
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  new Icon(Icons.wallet_giftcard),
                  const SizedBox(width: 10),
                  An.text("Paymentmethod".tr,
                      size: fontSizeTitle, fontWeight: FontWeight.bold)
                ],
              ),
              new Column(
                children: [],
              )
            ],
          )
        ],
      ),
    );
  }
}
