import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_Profile.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/View/Country/ScreenCountry.dart';

import 'Component/Header.dart';

class ScreenProfile extends GetView<ControllerProfile> {
  double size = fontSizePrice + 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //===========AppBar============================================
      appBar: AppBar(
        elevation: 0,
        title: An.text("profile".tr,
            color: ColorApp.blackColor(context), size: fontSizeTitle),
        backgroundColor: ColorApp.scaffold(context),
      ),

      //===========body============================================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //======body======================================================
              Header(),

              SizedBox(height: 30),
              new Container(
                decoration: buildBoxDecoration(),
                child: Column(
                  children: [
                    ListTile(
                      title: An.text("aboutus".tr, size: size),
                      leading: Icon(Icons.api_outlined,
                          color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    ListTile(
                      title: An.text("branches".tr, size: size),
                      leading: Icon(Icons.location_searching,
                          color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    )
                  ],
                ),
              ),

              SizedBox(height: 30),
              An.text("informations".tr,
                  size: fontSizeTitle, fontWeight: FontWeight.bold),
              SizedBox(height: 6),
              new Container(
                decoration: buildBoxDecoration(),
                child: Column(
                  children: [
                    ListTile(
                        title: An.text("countrylanguage".tr, size: size),
                        leading: Icon(Icons.language,
                            color: ColorApp.primary(context)),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Go.goNavBarRouteSettings(
                            context: context,
                            name: AppRoutes.country,
                            widget: ScreenCountry())),
                    buildDivider(),
                    ListTile(
                      title: An.text("privacypolicy".tr, size: size),
                      leading: Icon(Icons.insert_drive_file,
                          color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    ListTile(
                      title: An.text("returnpolicy".tr, size: size),
                      leading:
                          Icon(Icons.timer, color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    ListTile(
                      title: An.text("TermsConditions".tr, size: size),
                      leading: Icon(Icons.file_copy_rounded,
                          color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    ListTile(
                      title: An.text("FrequentlyAskedQuestions".tr, size: size),
                      leading:
                          Icon(Icons.message, color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    ListTile(
                      title: An.text("callus".tr, size: size),
                      leading:
                          Icon(Icons.phone, color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    buildDivider(),
                    ListTile(
                      title: An.text("RatethisApp".tr, size: size),
                      leading:
                          Icon(Icons.star, color: ColorApp.primary(context)),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
        color: Colors.blueGrey.shade50.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10));
  }

  Divider buildDivider() => Divider(height: 15);
}
