import 'package:flutter/material.dart';
import 'package:fruity/Controller/ControllerPayment.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: An.widthQuery(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorApp.searchBox(context))),
      child: GetBuilder<ControllerPayment>(
        builder: (controller) {
          return Column(
            children: [
              Row(
                children: [
                  Icon(Icons.payment, size: 30),
                  const SizedBox(width: 10),
                  An.text("Paymentmethod".tr,
                      size: fontSizeTitle, fontWeight: FontWeight.bold),
                ],
              ),
              RadioListTile(
                  title: An.text("PaymentReceipt".tr, size: fontSizeTitle),
                  value: 1,
                  activeColor: ColorApp.primary(context),
                  groupValue: controller.groupValue,
                  onChanged: (value) => controller.onChanged(value)),
              RadioListTile(
                  title: An.text("Knet".tr, size: fontSizeTitle),
                  value: 2,
                  activeColor: ColorApp.primary(context),
                  groupValue: controller.groupValue,
                  onChanged: (value) => controller.onChanged(value)),
            ],
          );
        },
      ),
    );
  }
}
