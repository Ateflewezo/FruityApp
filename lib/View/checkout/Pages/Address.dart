import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/View/checkout/Component/BoxGovernmnets.dart';
import '/View/checkout/Component/FormAddress.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import '/View/checkout/Component/BoxTab.dart';
import 'package:get/get.dart';
import '../../../Controller/Controller_checkout.dart';



class Address extends StatelessWidget {
  final Function nextPage, previousPage;
  const Address({Key key, this.nextPage, this.previousPage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ControllerCheckout controller = Get.find();
    return ListView(
      children: [


        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 30),
              An.text("OrderDeliveryAddress".tr,size: fontSizeTitle,fontWeight: FontWeight.bold),
              const SizedBox(height: 5),
              An.text("ExactLocation".tr,
                  size: fontSizeSubTitle,color: ColorApp.subTitle(context)),
              const SizedBox(height: 5),


              //======================================= نوع العنوان===========
              TabTypeAddress(),

              BoxGovernmnets(),

              GetBuilder<ControllerCheckout>(
                builder: (controller) => IndexedStack(
                  index: controller.isIndex,
                  children: [
                    FormAddress(visibility: false,keyFrom: controller.keyAddressHome,name1:"houseNumber".tr,),
                    FormAddress(visibility: true,keyFrom: controller.keyAddressApartment,name1:"buildingNumber".tr,name2: "ApartmentNumber".tr,),
                    FormAddress(visibility: true,keyFrom: controller.keyAddressOffice,name1: "collectorNumber".tr,name2: "OfficeNumber".tr),
                  ],
                ),
              ),
            ],
          ),
        ),


        //===== Button Next and previous =====================================
        Padding(
          padding: const EdgeInsets.only(bottom: 50, right: 15, left: 15,top: 20),
          child: new Row(
            children: [
              Expanded(
                flex: 3,
                child: An.buttonElevated(
                  name: "next".tr,
                  fontSize: 20,
                  height: 60,
                  fontFamily: fontFamily,
                  radius: 10,
                  colorPrimary: ColorApp.primary(context),
                  onPressed: ()=>controller.getDataAddressFromUser()
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: An.buttonElevated(
                  name: "Previous".tr,
                  fontSize: 20,
                  height: 60,
                  fontFamily: fontFamily,
                  radius: 10,
                  colorPrimary: ColorApp.subTitle(context),
                  onPressed: previousPage,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

