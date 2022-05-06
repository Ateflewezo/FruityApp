import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class Go {

  static Future<dynamic> goNavBarRouteSettings(
      {BuildContext context, String name, Widget widget, Object arguments}) {
    return pushNewScreenWithRouteSettings(
      context,
      settings: RouteSettings(name: name,arguments:arguments),
      screen: widget,
      withNavBar: true,
      pageTransitionAnimation: PageTransitionAnimation.cupertino,
    );
  }


  //==================== Navigator pop =========================================
  static void pop() => Navigator.pop(Get.context);

  // اذا كانت الصفحة لها صفحة سابقة وتقبل الرجوع سوف ترجع وان لم يكن لها صفحة سابقة لا تعمل اي تاثير
  //==================== Navigator canPop =========================================
  static bool canPop() => Navigator.canPop(Get.context);

  //==================== Navigator.push ========================================
  static Future<dynamic> to(Widget widget) {
    return Navigator.push(
      Get.context,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
