import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Controller/ControllerPayment.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/Navigator.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'Component/BoxtimeAndAddress.dart';
import 'Component/PaymentMethod.dart';
import 'Component/boxTotlePrice.dart';


class ScreenPayment extends GetView<ControllerPayment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //=======AppBar==================================
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorApp.scaffold(context),
        title: An.text("Confirmation".tr),
        actions: [
          IconButton(
              onPressed: () {Go.pop();},
              icon: Icon(
                Icons.arrow_forward_ios_outlined,
                color: ColorApp.blackColor(context),
              ))
        ],
      ),


      bottomNavigationBar:Container(
        margin: const EdgeInsets.only(top: 10,bottom: 40,right: 10,left: 10),
        child:An.buttonElevated(
            name: "Confirmation".tr,
            width: An.widthQuery(),
            radius: 10,
            height: 60,
            fontSize: fontSizeTitle,
            fontFamily: "$fontFamily",
            colorPrimary: ColorApp.primary(context),
            onPressed: ()=>controller.payment()),
      ),

      //=======body==================================
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [

              //===================================== عنوان التوصيل ==========
              buildSizedBox(),

              buildContainer(
                context,
                title: "address".tr,
                subTitle: "${getSave.read(confirmSave)["data"]["address"]["content"]}",
                icon: Icons.location_on_rounded,
              ),

              //======================================= وقت التوصيل ==========
              buildSizedBox(),
              buildContainer(context,
                  title: "Deliverytime".tr,
                  subTitle:
                  getSave.read(confirmSave)["data"]["arrivalData"]["day"]
                      +"   "+ getSave.read(confirmSave)["data"]["arrivalData"]["date"]
                      +"   "+ getSave.read(confirmSave)["data"]["arrivalData"]["times"],
                  icon: Icons.timer,
                  onTap: () {}
              ),

              //======================================= طريقة الدفع ==========
              buildSizedBox(),
              PaymentMethod(),


              //=================================== اجمالي الفاتورة ==========
              buildSizedBox(),
              BoxTitlePrice(),



              //======================================= تاكيد الطلب ==========
              buildSizedBox(),

            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 20);
}


