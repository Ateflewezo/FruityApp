import 'package:get/get.dart';
import 'package:fruity/View/OrderDitiles/ScreenOrderDitiles.dart';
import 'package:fruity/View/selectedlang/ScreenSelectedlang.dart';
import '/View/Country/ScreenCountry.dart';
import '/View/DoneOrder/ScreenDoneOrder.dart';
import '/View/KeyNet/ScreenKeyNet.dart';
import '/View/MyOrders/ScreenMyOrder.dart';
import '/View/Payment/ScreenPayment.dart';
import '/View/checkout/ScreenCheckout.dart';
import '/View/onBoardingPage/on_boarding_view.dart';
import '/Helper/routes/routes.dart';
import '/View/Cart/ScreenCart.dart';
import '/View/Home/ScreenHome.dart';
import '/View/Navbar/BottomNavigationBar.dart';
import '/View/ProductDetails/ScreenProductDetails.dart';
import '/View/Search/ScreenSearch.dart';

class AppPage {
  static final pages = [
    GetPage(name: AppRoutes.homeApp, page: () => ScreenHome()),
    GetPage(name: AppRoutes.homeNavBar, page: () => HomeNavigationBar()),
    GetPage(name: AppRoutes.productDetails, page: () => ScreenProductDetails()),
    GetPage(name: AppRoutes.cart, page: () => ScreenCart()),
    GetPage(name: AppRoutes.onBoardingPage, page: () => OnBoardingPage()),
    GetPage(name: AppRoutes.country, page: () => ScreenCountry()),
    GetPage(name: AppRoutes.search, page: () => ScreenSearch()),
    GetPage(name: AppRoutes.doneOrder, page: () => ScreenDoneOrder()),
    GetPage(name: AppRoutes.payment, page: () => ScreenPayment()),
    GetPage(name: AppRoutes.keyNet, page: () => ScreenKeyNet()),
    GetPage(name: AppRoutes.checkout, page: () => ScreenCheckout()),
    GetPage(name: AppRoutes.myOrder, page: () => ScreenMyOrder()),
    GetPage(name: AppRoutes.orderDetails, page: () => ScreenOrderDetails()),
    GetPage(name: AppRoutes.selectedLang, page: () => ScreenSelectedLang()),
  ];
}
