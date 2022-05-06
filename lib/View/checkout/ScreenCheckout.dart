import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '/View/checkout/Pages/Data.dart';
import '/View/checkout/Pages/Time.dart';
import 'Component/appBarCheckout.dart';
import 'Component/boxSection.dart';
import '../../Controller/Controller_checkout.dart';
import 'Pages/Address.dart';

class ScreenCheckout extends GetView<ControllerCheckout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=== appBar =============================================================
      appBar: appBarCheckout(context),

      //=== body ===============================================================
      body: Obx(() {
        return ModalProgressHUD(
          inAsyncCall: controller.isLoading.value,
          child: Column(
            children: [
              //=====================ايقونة واسم القسم التي تظهر في الاعلي  =======
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50.withOpacity(0.9),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    BoxSection(
                        pageColor: 0,
                        name: "CustomerData".tr,
                        icon: Icons.supervisor_account_rounded),
                    BoxSection(
                        pageColor: 1,
                        name: "DeliveryAddress".tr,
                        icon: Icons.location_on),
                    BoxSection(
                        pageColor: 2,
                        name: "DeliveryTime".tr,
                        icon: Icons.timer),
                  ],
                ),
              ),

              //=====================================================الصفحات =====
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: (value) => controller.onPageChanged(value),
                  children: [
                    DataOfUser(next: () => controller.nextPage()),
                    Address(
                        nextPage: () => controller.nextPage(),
                        previousPage: () => controller.previousPage()),
                    DeliveryTime(),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
