import 'package:flutter/material.dart';
import 'package:fruity/Helper/WidgetShareApp/myTextFieldOutline.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_checkout.dart';

class FormAddress extends StatelessWidget {
  final bool visibility;
  final Key keyFrom;
  final String name1, name2;

  const FormAddress(
      {Key key, this.visibility, this.keyFrom, this.name1, this.name2})
      : super(key: key);

  Widget build(BuildContext context) {
    ControllerCheckout controller = Get.find();
    return Form(
      key: keyFrom,
      child: Column(
        children: [
          buildSizedBox(),
          MyTextFieldOutline(
            controller: controller.block,
            maxLines: 1,
            borderRadius: 10,
            labelText: "block".tr,
            filled: true,
            textInputAction: TextInputAction.next,
            colorfill: Colors.white,
          ),
          buildSizedBox(),
          MyTextFieldOutline(
            controller: controller.street,
            maxLines: 1,
            borderRadius: 10,
            labelText: "street".tr,
            filled: true,
            textInputAction: TextInputAction.next,
            colorfill: Colors.white,
          ),
          buildSizedBox(),
          MyTextFieldOutline(
            controller: controller.gada,
            maxLines: 1,
            borderRadius: 10,
            labelText: "gada".tr,
            filled: true,
            textInputAction: TextInputAction.next,
            colorfill: Colors.white,
          ),
          buildSizedBox(),
          MyTextFieldOutline(
            controller: controller.homeNumber,
            maxLines: 1,
            borderRadius: 10,
            labelText: "$name1",
            filled: true,
            textInputAction: TextInputAction.done,
            colorfill: Colors.white,
          ),
          buildSizedBox(),
          Visibility(
            visible: visibility,
            replacement: SizedBox(),
            child: new Row(
              children: [
                Flexible(
                  child: MyTextFieldOutline(
                    controller: controller.turnNumber,
                    maxLines: 1,
                    borderRadius: 10,
                    labelText: "turnNumber".tr,
                    filled: true,
                    textInputAction: TextInputAction.next,
                    colorfill: Colors.white,
                  ),
                ),
                const SizedBox(width: 15),
                Flexible(
                  child: MyTextFieldOutline(
                    controller: controller.apartmentNumber,
                    maxLines: 1,
                    borderRadius: 10,
                    textInputAction: TextInputAction.done,
                    labelText: "$name2",
                    filled: true,
                    colorfill: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 15);
}
