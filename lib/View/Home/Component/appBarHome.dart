import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/View/Search/ScreenSearch.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import '/Controller/Controller_HomeApp.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Helper/colorApp.dart';
import 'package:get/get.dart';
import '/Helper/routes/routes.dart';

final ControllerHomeApp controller = Get.find();

Widget appBarHome(BuildContext context) {

  return AppBar(
    elevation: 0,
    centerTitle: true,
    titleSpacing: 0,
    backgroundColor: ColorApp.scaffold(context),
    title: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: An.widthQuery(),
        height: 80,
        color: ColorApp.scaffold(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //==== logo App =============================
            Flexible(
              child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Align(
                      alignment: Get.locale.languageCode == "ar"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: An.cachedNetworkImage(
                          Get.find<ControllerHomeApp>().logoApp))),
            ),
            const SizedBox(width: 10),

            //==== change lang and Button search  =============================
            new Row(
              children: [
                //====  Button search  =============================
                GestureDetector(
                  onTap: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: AppRoutes.search),
                      screen: ScreenSearch(),
                      withNavBar: true,
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino,
                    );
                  },
                  child: Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        Icon(CupertinoIcons.search, color: Colors.black),
                        new VerticalDivider(
                          color: ColorApp.blackColor(context),
                          endIndent: 6,
                          indent: 6,
                        ),
                        An.text("search".tr, size: fontSizeSubTitle)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 5),

                //==== change lang AR EN =============================
                GestureDetector(

                  onTap: Get.locale.languageCode == "ar"
                      ? () => controller.changeEnglish(context)
                      : () => controller.changeArabic(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: ColorApp.primaryWithOpacit2(context),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                        child: An.text(
                            Get.locale.languageCode == "ar" ? "EN" : "AR",
                            size: fontSizeTitle,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ],
        )),
  );
}
