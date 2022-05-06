import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/WidgetShareApp/myTextFieldOutline.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';
import '/Controller/Controller_checkout.dart';


class DataOfUser extends StatelessWidget {
final Function next;
const DataOfUser({Key key, this.next}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ControllerCheckout controller = Get.find();
    return ListView(
        children: [


          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: controller.keyInFo,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 30),
                  An.text("ReceiptData".tr,size: fontSizeTitle,fontWeight: FontWeight.bold),
                  const SizedBox(height: 30),



                  An.text("UserName".tr,size:fontSizeSubTitle,color: ColorApp.subTitle(context)),
                  const SizedBox(height: 10),
                  MyTextFieldOutline(
                    controller:controller.name,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    maxLength: 20,
                    borderRadius: 10,
                    labelText:"UserName".tr,
                    textInputAction:TextInputAction.next,
                    prefixIcon: Icons.account_circle_outlined,
                    filled: true,
                    colorfill: Colors.white,
                  ),

                  const SizedBox(height: 20),
                  An.text("UserName".tr,size:fontSizeSubTitle,color: ColorApp.subTitle(context)),
                  const SizedBox(height: 10),
                  MyTextFieldOutline(
                    controller:controller.email,
                    textInputType: TextInputType.emailAddress,
                    textInputAction:TextInputAction.next,
                    maxLines: 1,
                    borderRadius: 10,
                    labelText: "Email".tr,
                    prefixIcon: Icons.email,
                    filled: true,
                    colorfill: Colors.white,
                  ),


                  const SizedBox(height: 20),
                  An.text("TelephoneNumber".tr,size:fontSizeSubTitle,color: ColorApp.subTitle(context)),
                  const SizedBox(height: 10),

                  new Container(
                    height: 60,
                    child:Row(
                      children: [

                        Expanded(
                          child: Container(
                            height: 50,
                            child: MyTextFieldOutline(
                              maxLines: 1,
                              maxLength: 8,
                              controller:controller.phone,
                              borderRadius: 10,
                              labelText: "TelephoneNumber".tr,
                              textInputType: TextInputType.phone,
                              prefixIcon: Icons.phone_android,
                              filled: true,
                              textInputAction:TextInputAction.go,
                              colorfill: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),
                        new Container(
                          height: 70,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 0.5,color: ColorApp.subTitle(context)),
                          ),
                          child: Row(
                            children: [
                              An.text("965+",size: fontSizeTitle,fontWeight: FontWeight.bold),
                              const SizedBox(width:5),
                              SvgPicture.asset("assets/images/kuwait.svg",width: 30,),
                            ],
                          ),
                        )

                      ],
                    ),
                  ),



                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 50, right: 10, left: 10,top: 50),
            child: An.buttonElevated(
              name: "next".tr,
              fontSize: 20,
              height: 60,
              colorPrimary: ColorApp.primary(context),
              width: An.widthQuery(),
              fontFamily: fontFamily,
              radius: 10,
              onPressed: (){
                if(controller.keyInFo.currentState.validate()){
                  next();
                }
              },
            ),
          ),


        ],
    );
  }
}
