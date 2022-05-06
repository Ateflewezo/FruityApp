import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:fruity/Controller/Controller_Cart.dart';
import 'package:platform_device_id/platform_device_id.dart';

import '/Api/Api_Cart.dart';
import '/Api/Api_Product.dart';
import '/Helper/WidgetShareApp/Navigator.dart';
import '/Model/model_addCart.dart';
import '/Model/model_cart.dart';
import '/Model/model_category.dart';
import '/Model/model_product.dart';

class ControllerProduct extends GetxController {
  Future futureApiProduct;
  ControllerCart controllerCart = Get.find();
  DatumProduct isFav;
  ProductsCart isPro;

  var isLoading = true.obs;
  var isAdded = false.obs;

  ProductData dateProduct;
  int selectedItem;
  List<OrderFeature> orderFeature;

  // quantityProduct ===========================================================
  String quantityProduct;

  // Features ID Product =======================================================

  // title Features =======================================================
  String get titleFeatures => dateProduct.features[0].title;

  //============================================= عملة احتساب السعرالاضافي للمنتج
  double priceProduct() => double.parse(dateProduct.discount);
  double afterExtraPrice;

  //==== Selected feature Product ==============================================
  Option optionProduct;
  void setSelectedItem({int index, Option option}) {
    selectedItem = index;
    quantityProduct = option.count.toString();
    afterExtraPrice = priceProduct() + double.parse(option.price);
    optionProduct = option;
    update();
  }

  //=====onInit=================================================================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    futureApiProduct = fetchApiProduct(id: Get.arguments).then((value) {
      afterExtraPrice = double.parse(dateProduct.discount);
      quantityProduct = dateProduct.quantity;
    }).then((value) {
      isPro = controllerCart.cartList.singleWhere(
          (element) => element.productId == dateProduct.id,
          orElse: () => null);
    });
  }

  //== هنا يعمل فلتر اذا كان المنتج موجود في السلة

  //=====fetchApiProduct========================================================
  Future<void> fetchApiProduct({int id}) async {
    try {
      isLoading(true);
      var data = await ApiProduct.fetchData(id);
      if (data != null) {
        dateProduct = data.data.product;
      }
      return null;
    } finally {
      isLoading(false);
    }
  }

  //======add Features IsEmpty =================================================
  // اضافة المنتج الي السلة اذا كان لا يوجد خصائص للمنتج
  Future<void> addFeaturesIsEmpty() async {
    String deviceId = await PlatformDeviceId.getDeviceId;
    Map<String, dynamic> bodyDat = {
      "mac_address": "$deviceId",
      "product_id": dateProduct.id.toString(),
      "quantity": "1",
      "price": dateProduct.discount.toString(),
    };
    await ApiCart.addProductToCart(bodyDat);
    await controllerCart.fetchApiGetCart();
    controllerCart.update();
    update();
  }

  //====== add By Features =====================================================
  // اضافة المنتج للسلة اذا كان يوجد لدية خصائص
  Future<void> addByFeatures() async {
    String deviceId = await PlatformDeviceId.getDeviceId;
    Map<String, dynamic> dataBody = {
      "mac_address": "$deviceId",
      "product_id": dateProduct.id.toString(),
      "quantity": "1",
      "price": dateProduct.discount.toString(),
      "order_feature": [
        {
          "feature_id": "${optionProduct.featureId}",
          "option_id": "${optionProduct.id}",
          "title": "${optionProduct.title}",
          "price": "${optionProduct.price}",
        }
      ]
    };
    await ApiCart.addProductToCart(dataBody);
    await controllerCart.fetchApiGetCart();
    isAdded = controllerCart.cartList
        .map((element) => element.productId)
        .contains(dateProduct.id)
        .obs;
    update();
  }

  //====== unSelected ==========================================================
  void unSelected() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO,
      title: "ChooseProductFeatures".tr,
    )..show();
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }
}
