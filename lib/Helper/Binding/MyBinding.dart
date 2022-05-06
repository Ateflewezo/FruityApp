import 'package:get/get.dart';
import '/Controller/Controller_Favorite.dart';
import '/Controller/Controller_MyOrder.dart';
import '/Controller/Controller_NavigationBar.dart';
import '/Controller/Controller_OrderDetails.dart';
import '/Controller/ControllerPayment.dart';
import '/Controller/Controller_Cart.dart';
import '/Controller/Controller_Category.dart';
import '/Controller/Controller_Country.dart';
import '/Controller/Controller_HomeApp.dart';
import '/Controller/Controller_Product.dart';
import '/Controller/Controller_Profile.dart';
import '/Helper/NetworkConnectivity/Control_network.dart';
import '/Controller/Controller_checkout.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ControllerHomeApp(), fenix: true);
    Get.lazyPut(() => ControllerCategory(), fenix: true);
    Get.lazyPut(() => ControllerProduct(), fenix: true);
    Get.lazyPut(() => ControllerCart(), fenix: true);
    Get.put(ControllerCart());
    Get.lazyPut(() => ControllerCountry(), fenix: true);
    Get.lazyPut(() => ControllerProfile(), fenix: true);
    Get.lazyPut(() => ControllerNetwork(), fenix: true);
    Get.lazyPut(() => ControllerPayment(), fenix: true);
    Get.lazyPut(() => ControllerCheckout(), fenix: true);
    Get.lazyPut(() => ControllerMyOrder(), fenix: true);
    Get.lazyPut(() => ControllerNavigationBar(), fenix: true);
    Get.lazyPut(() => ControllerOrderDetails(), fenix: true);
    Get.lazyPut(() => ControllerFavorites(), fenix: true);
  }
}
