import 'dart:async';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:fruity/Api/Api_Cart.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Model/model_cart.dart';

class ControllerCart extends GetxController {
  RxList<ProductsCart> cartList = RxList<ProductsCart>();
  Future futureApiCart;
  OrderInfo orderInfo;
  String totalPrice;
  var isLoading = true.obs;

  //========== fetch Api GetCart Master ========================================
  Future<void> fetchApiGetCart({bool load = true}) async {
    try {
      isLoading(load);
      var dataCart = await ApiCart.getCart();
      cartList.clear();
      if (dataCart != null) {
        cartList.addAll(dataCart.data.products);
        orderInfo = dataCart.data.orderInfo;
        totalPrice = dataCart.data.totalPrice;
      }
    } finally {
      isLoading(false);
      // update();
    }
  }

  Future<void> refreshCart() async {
    futureApiCart = null;
    futureApiCart = fetchApiGetCart();
    update();
  }

  //========== Delete Item From Cart  ==========================================
  void deleteItem(ProductsCart item, int index) {
    AwesomeDialog(
      context: Get.context,
      dialogType: DialogType.ERROR,
      animType: AnimType.BOTTOMSLIDE,
      title: 'wantDeleteProduct'.tr,
      desc: '${item.name}',
      btnCancelOnPress: () {},
      btnOkOnPress: () async {
        await ApiCart.deleteCart(productID: item.id.toString(), index: index);
        timerUpdateDataCart(false);
        cartList.removeWhere((element) => element.productId == item.productId);
        //  await fetchApiGetCart();
      },
    )..show();

    update();
  }

  //========== Edit Item Cart Minus  ==========================================
  void editItemCartMinus(ProductsCart item) async {
    if (item.quantity != "1") {
      await ApiCart.editCart(productID: item.id.toString(), type: "minus");
      timerUpdateDataCart(true);
      update();
    }
  }

  //========== Edit Item Cart Minus  ==========================================
  void editItemCartPlus(ProductsCart item) async {
    if (item.mainQuantity == item.mainQuantity.toString()) {
      await ApiCart.editCart(productID: item.id.toString(), type: "plus");
      timerUpdateDataCart(true);
      update();
    }
  }

  //============================================ تعديل كمية المنتج من صفحة السلة ========
  void addQuantity(int id) async {
    await ApiCart.editCart(productID: id.toString(), type: "plus");
    timerUpdateDataCart(true);
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      timer.cancel();
    });
    update();
  }

  Timer timerUpdateDataCart(bool load) {
    return Timer.periodic(Duration(milliseconds: 100), (timer) {
      fetchApiGetCart(load: load);
      timer.cancel();
    });
  }

  //========== onInit =============================================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    futureApiCart = fetchApiGetCart();
  }

  void doneAdd() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.SUCCES,
      title: 'ProductAddedSuccessfully'.tr,
    )..show().then((value) {
        refreshCart();
      });
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }
}
