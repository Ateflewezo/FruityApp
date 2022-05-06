import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruity/Controller/Controller_search.dart';
import 'package:fruity/Helper/colorApp.dart';
import '/Controller/Controller_MyOrder.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/WidgetShareApp/myTextFieldOutline.dart';
import '/Helper/routes/routes.dart';
import '/Model/ModelMyOrders.dart';
import '/View/MyOrders/Component/shipped.dart';
import '/View/MyOrders/Component/refused.dart';
import 'Component/accepted.dart';
import 'Component/complete.dart';
import 'package:get/get.dart';
import 'Component/wait.dart';

class ScreenMyOrder extends GetView<ControllerMyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: controller.futureApiOrder,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return controller.lisOrder.isEmpty
                ? orderEmpty()
                : Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 80, left: 20, right: 20),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.shopping_cart_sharp),
                                    An.text("MyOrder".tr,
                                        size: fontSizeTitle,
                                        fontWeight: FontWeight.bold),
                                    An.text("${controller.lisOrder.length}",
                                        size: fontSizeTitle,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                An.buttonElevatedIcon(
                                    name: "Update".tr,
                                    width: 130,
                                    height: 40,
                                    radius: 10,
                                    onPressed: () =>
                                        controller.fetchApiMyOrder(),
                                    colorPrimary: ColorApp.primary(context),
                                    fontFamily: fontFamily,
                                    fontSize: fontSizeTitle,
                                    icon: Icons.update),
                              ],
                            ),
                            SizedBox(height: 20),
                            MyTextFieldOutline(
                              suffixIcon: Icons.search,
                              colorfill: Colors.white70,
                              filled: true,
                              borderRadius: 10,
                              maxLines: 1,
                              onChanged: (value) =>
                                  controller.changeSearch(value),
                              textInputAction: TextInputAction.done,
                              hint: "SearchNumber".tr,
                            ),
                          ],
                        ),
                      ),
                      new Expanded(
                        child: GetBuilder<ControllerMyOrder>(
                          builder: (logic) {
                            return RefreshIndicator(
                              onRefresh: () => controller.fetchApiMyOrder(),
                              child: controller.lisOrderSearch.isEmpty
                                  ? orderSearchEmpty()
                                  : ListView.builder(
                                      physics: BouncingScrollPhysics(),
                                      itemCount:
                                          controller.lisOrderSearch.length,
                                      itemBuilder: (context, index) {
                                        DatumMyOrder order =
                                            controller.lisOrderSearch[index];
                                        onTap() =>
                                            Get.toNamed(AppRoutes.orderDetails,
                                                arguments: order.id);
                                        switch (order.status) {
                                          case "accepted":
                                            return Accepted(
                                                order: order,
                                                onTap: () => onTap());
                                            break;

                                          case "shipped":
                                            return Shipped(
                                                order: order,
                                                onTap: () => onTap());
                                            break;

                                          case "complete":
                                            return Complete(
                                                order: order,
                                                onTap: () => onTap());
                                            break;

                                          case "refused":
                                            return Refused(
                                                order: order,
                                                onTap: () => onTap());
                                            break;

                                          case "wait":
                                            return Wait(
                                                order: order,
                                                onTap: () => onTap());
                                            break;

                                          default:
                                            return Accepted(
                                                order: order,
                                                onTap: () => onTap());
                                            break;
                                        }
                                      },
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
          }
          return An.circular();
        },
      ),
    );
  }

  Center orderEmpty() => Center(
          child: Column(
        children: [
          const SizedBox(height: 200),
          SvgPicture.asset("assets/images/orderEmpty.svg",
              width: 200, height: 200),
          const SizedBox(height: 40),
          An.text("notFoundOrder".tr, size: fontSizeTitle + 4)
        ],
      ));

  Center orderSearchEmpty() => Center(
        child: Column(
          children: [
            const SizedBox(height: 200),
            Image.asset("assets/images/Ghost.gif"),
            An.text("notnumber".tr, size: fontSizeTitle),
          ],
        ),
      );
}
