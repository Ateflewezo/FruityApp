import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/WidgetShareApp/numberCart.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import '/Controller/Controller_Cart.dart';
import '/Model/model_cart.dart';
import 'Component/BoxPriceAndButtonPayment.dart';
import 'Component/BoxProduct.dart';
import 'Component/EmptyCart.dart';
import 'Component/appBarCart.dart';

class ScreenCart extends GetView<ControllerCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //====AppBar =============================================
      appBar: appBarCart(context),
      backgroundColor: ColorApp.scaffold(context),

      //====body =============================================
      body: Obx(() {
        return controller.cartList.isEmpty
            ? EmptyCart()
            : ModalProgressHUD(
                color: Colors.white,
                inAsyncCall: controller.isLoading.value,
                child: Column(
                  children: [
                    Expanded(
                      child: new Container(
                        child: ListView.builder(
                          itemCount: controller.cartList.length,
                          itemBuilder: (context, index) {
                            ProductsCart item = controller.cartList[index];
                            return BoxProduct(
                                productsCart: item,
                                onTapAddQuantity: () =>
                                    controller.editItemCartPlus(item),
                                onTapReduceQuantity: () =>
                                    controller.editItemCartMinus(item),
                                onTapDelete: () =>
                                    controller.deleteItem(item, index));
                          },
                        ),
                      ),
                    ),
                    BoxPriceAndButtonPayment(
                      onTap: () => Get.toNamed(AppRoutes.checkout),
                      totlePrice: controller.totalPrice,
                    )
                  ],
                ),
              );
      }),
    );
  }
}
