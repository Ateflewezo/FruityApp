import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/Model/ModelDateTime.dart';
import 'package:fruity/Model/ModelTimeDelivery.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import '/Controller/Controller_checkout.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatelessWidget {
  final Function done, previousPage;
  const DeliveryTime({Key key, this.done, this.previousPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ControllerCheckout controller = Get.find();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<ControllerCheckout>(
            builder: (controller) => new Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  An.text("Choosedate".tr,
                      size: fontSizeTitle + 5, fontWeight: FontWeight.bold),
                  // const SizedBox(height: 15),
                  // new Container(
                  //   height: 60,
                  //   width: An.widthQuery(),
                  //   child: ListView.builder(
                  //     scrollDirection : Axis.horizontal,
                  //     itemCount: controller.listDateDelivery.length,
                  //     itemBuilder: (context, index) {
                  //     DatumDate item = controller.listDateDelivery[index];
                  //     return boxDate(controller, index, item, context);
                  //   },),
                  // ),

                  An.buttonElevatedIcon(
                    name: "Choose_Date".tr,
                    fontSize: 20,
                    width: An.widthQuery(),
                    height: 45,
                    colorPrimary: ColorApp.primary(context),
                    fontFamily: fontFamily,
                    radius: 10,
                    onPressed: () => controller.aliSelectDate(context),
                    icon: Icons.date_range_outlined,
                  ),
                  // Obx(() =>
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    width: An.widthQuery(),
                    height: 60,
                    child: controller.selectedDate == null
                        ? Text(
                            "Choose_Date".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 10,
                              color: Colors.grey.shade100,
                              fontFamily: fontFamily,
                            ),
                          )
                        : Text(
                            "${controller.selectedDate.day} / ${controller.selectedDate.month} / ${controller.selectedDate.year}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: fontFamily,
                            ),
                          ),
                  )
                  // )
                  ,

                  const SizedBox(height: 30),
                  An.text("Choosetime".tr,
                      size: fontSizeTitle + 5, fontWeight: FontWeight.bold),
                  const SizedBox(height: 15),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 7,
                    ),
                    itemCount: controller.listTimeDelivery.length,
                    itemBuilder: (context, index) {
                      DataTimeDelivery item =
                          controller.listTimeDelivery[index];
                      // String from = item.from.substring(0,5) + item.from.substring(8,11);
                      // String to = item.to.substring(0,5)+item.to.substring(8,11);

                      String from = item.from;
                      String to = item.to;

                      return GestureDetector(
                        onTap: () => controller.selectTime(index, item),
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: An.text("${from + " / " + to} ",
                              size: fontSizeSubTitle),
                          // child: An.text("${item.from + item.to}",size: fontSizeSubTitle),
                          decoration: BoxDecoration(
                              color: controller.isIndexTime == index
                                  ? Colors.amber[300]
                                  : Colors.blueGrey[50],
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          new Row(
            children: [
              Expanded(
                flex: 3,
                child: An.buttonElevatedIcon(
                  name: "Savingdata".tr,
                  fontSize: 20,
                  height: 60,
                  colorPrimary: ColorApp.primary(context),
                  fontFamily: fontFamily,
                  radius: 10,
                  onPressed: () => controller.done(),
                  icon: Icons.save_outlined,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: An.buttonElevated(
                  name: "Previous".tr,
                  height: 60,
                  fontSize: 20,
                  colorPrimary: ColorApp.subTitle(context),
                  fontFamily: fontFamily,
                  radius: 10,
                  onPressed: () => controller.previousPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget boxDate(ControllerCheckout controller, int index, DatumDate item, BuildContext context) {
  //   return GestureDetector(
  //                     onTap: ()=>controller.selectDate(index,item),
  //                     child: Container(
  //                       alignment: Alignment.center,
  //                       margin: const EdgeInsets.symmetric(horizontal: 5),
  //                       padding: const EdgeInsets.symmetric(horizontal: 15),
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(10),
  //                         color: controller.isIndexDate == index ? Colors.amber[300] : Colors.blueGrey[50],
  //                       ),
  //                       child: Column(
  //                         mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           An.text("${item.date}",size: fontSizeSubTitle,color: controller.isIndexDate == index ?Colors.black:ColorApp.subTitle(context)),
  //                           An.text("${item.day}",size: fontSizeSubTitle,color: controller.isIndexDate == index ?Colors.black:ColorApp.subTitle(context)),
  //                         ],
  //                       ),
  //                     ),
  //                   );
  // }

}
