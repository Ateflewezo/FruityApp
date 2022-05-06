import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_Product.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Model/model_product.dart';

class BoxProductFeatures extends StatelessWidget {
  ControllerProduct controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          An.text("${controller.dateProduct.features[0].title}",
              size: fontSizeTitle),
          SizedBox(height: 10),
          new Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.dateProduct.features[0].options.length,
              itemBuilder: (BuildContext context, int index) {
                Option listFeatures =
                    controller.dateProduct.features[0].options[index];
                // int listFeatures1 = controller.dateProduct.features[0].options[index].id;
                return GetBuilder<ControllerProduct>(
                  builder: (logic) {
                    return InkWell(
                      onTap: () {
                        controller.setSelectedItem(
                          index: index,
                          option: listFeatures,
                          // id: listFeatures1,
                        );
                      },
                      child: controller.selectedItem == index
                          ? activeColor(context, listFeatures)
                          : inactiveColor(context, listFeatures),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget activeColor(BuildContext context, Option listFeatures) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorApp.primary(context),
        ),
        child: Center(
          child: An.text("${listFeatures.title}",
              size: fontSizeTitle, color: ColorApp.whiteColor(context)),
        ));
  }

  Widget inactiveColor(BuildContext context, Option listFeatures) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blueGrey[100]),
          color: ColorApp.whiteColor(context),
        ),
        child: Center(
          child: An.text("${listFeatures.title}", size: fontSizeTitle),
        ));
  }
}
