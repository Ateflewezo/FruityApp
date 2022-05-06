import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Controller/Controller_NavigationBar.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/View/Cart/ScreenCart.dart';
import 'package:fruity/View/Favorite/ScreenFavorite.dart';
import 'package:fruity/View/Home/ScreenHome.dart';
import 'package:fruity/View/MyOrders/ScreenMyOrder.dart';
import 'package:fruity/View/Profile/ScreenProfile.dart';
import 'package:fruity/View/StartApp/ScreenStartApp.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeNavigationBar extends GetView<ControllerNavigationBar> {
  List<Widget> _buildScreens() {
    return [
      ScreenProfile(),
      ScreenCart(),
      ScreenHome(),
      ScreenFavorite(),
      ScreenMyOrder(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.account_circle_rounded),
        title: ("profile".tr),
        activeColorPrimary: ColorApp.primary(context),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart),
        title: ("Cart".tr),
        activeColorPrimary: ColorApp.primary(context),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home, color: Colors.white),
        title: ("home".tr),
        // activeColorPrimary: CupertinoColors.activeBlue,
        activeColorPrimary: ColorApp.primary(context),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite),
        title: ("Favorite".tr),
        activeColorPrimary: ColorApp.primary(context),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_bag),
        title: ("MyOrder".tr),
        activeColorPrimary: ColorApp.primary(context),
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<ControllerHomeApp>().futureApiHome,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildPersistentTabView(context);
        }
        return StartApp();
      },
    );
  }

  PersistentTabView _buildPersistentTabView(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller.controller,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style17, // Choose the nav bar style with this property.
    );
  }
}
