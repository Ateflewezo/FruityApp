import 'package:flutter/material.dart';
import '/Controller/Controller_OrderDetails.dart';
import '/Model/ModelOrderDetails.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';

import 'BoxProduct.dart';

class ListProductOrder extends StatelessWidget {
  ControllerOrderDetails controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: An.widthQuery(),
        child: ListView.builder(
          itemCount: controller.listProductOrder.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            ProductOrder item = controller.listProductOrder[index];
            return BoxProduct(item: item);
          },
        ));
  }
}

