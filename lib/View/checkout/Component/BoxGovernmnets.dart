import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_checkout.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Model/ModelModelRegions.dart';
import 'package:fruity/Model/Modelgovernmnets.dart';
import 'package:get/get.dart';

class BoxGovernmnets extends StatefulWidget {
  @override
  _BoxGovernmnetsState createState() => _BoxGovernmnetsState();
}

class _BoxGovernmnetsState extends State<BoxGovernmnets> {
  governmnetsData governmnetList;
  DataRegions regionsList;

  String nameGovernmnets = "ChooseProvince".tr;
  String nameRegions = "ChooseRegion".tr;

  @override
  Widget build(BuildContext context) {
    ControllerCheckout controller = Get.find();
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: new DropdownButton<governmnetsData>(
              underline: SizedBox(),
              isExpanded: true,
              hint: An.text(nameGovernmnets),
              onChanged: (governmnetsData item) {
                controller.onTapGovernmnets(item);
                setState(() {
                  nameGovernmnets = item.name;
                });
              },
              items: controller.listGovernmnets.map((governmnetsData itme) {
                return new DropdownMenuItem<governmnetsData>(
                  value: itme,
                  child: new Text(
                    itme.name,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.5, color: Colors.blueGrey),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: new DropdownButton<DataRegions>(
              underline: SizedBox(),
              isExpanded: true,
              hint: An.text(nameRegions),
              onChanged: (DataRegions item) {
                controller.onTapRegions(item);
                setState(() {
                  nameRegions = item.name;
                });
              },
              items: controller.listRegions.map((DataRegions itme) {
                return new DropdownMenuItem<DataRegions>(
                  value: itme,
                  child: new Text(
                    itme.name,
                    style: new TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      );
    });
  }
}
