import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Controller/Controller_OrderDetails.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/Navigator.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'Component/InfoOrder.dart';
import 'Component/ListViewProductOrder.dart';
import 'Component/detailsOrder.dart';
import 'Component/paymentMethod.dart';
import 'Component/totalPrice.dart';

class ScreenOrderDetails extends GetView<ControllerOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=======AppBar=========================================================
      appBar: AppBar(
        elevation: 0,
        title: An.text("Orderdetails".tr),
        leading: SizedBox(),
        backgroundColor: ColorApp.scaffold(context),
        actions: [
          IconButton(
              onPressed: () => Go.pop(),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: ColorApp.blackColor(context),
              ))
        ],
      ),

      //=======AppBar=========================================================
      body: FutureBuilder(
        future: controller.futureDetails,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InfoOrder(),
                    const SizedBox(height: 15),
                    DetailsOrder(),
                    const SizedBox(height: 35),
                    BoxTotalPrice(),
                    const SizedBox(height: 20),
                    PaymentMethod(),
                    const SizedBox(height: 20),
                    An.text("orderproducts".tr,
                        size: fontSizeTitle,
                        fontWeight: FontWeight.bold,
                        color: ColorApp.primary(context)),
                    const SizedBox(height: 15),
                    ListProductOrder(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        An.text("Doproblem".tr),
                        An.text("Contactservice".tr,
                            color: ColorApp.primary(context)),
                      ],
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            );
          }
          return An.circular();
        },
      ),
    );
  }

  Row namValueText({String name, value}) {
    return Row(
      children: [
        An.text("$name", size: fontSizePrice + 3),
        const SizedBox(width: 50),
        An.text("$value", size: fontSizePrice + 3),
      ],
    );
  }
}
