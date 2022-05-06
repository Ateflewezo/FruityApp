import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fruity/Controller/Controller_Category.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/Model/model_category.dart';
import 'package:fruity/View/Home/Component/NotFoundProduct.dart';
import 'package:fruity/View/Home/Product_Theme2/ProductTow.dart';
import 'package:get/get.dart';
import 'package:fruity/View/ProductDetails/ScreenProductDetails.dart';

class ThemeProductTow extends StatelessWidget {
  ControllerCategory controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: controller.listProductByCategory.isNotEmpty,
      builder: (context) => controller.pagingController.itemList.isEmpty
          ? sliverToBoxCircular()
          : sliverGridProduct(),
      fallback: (context) => NotFoundProduct(),
    );
  }

  //===== CircularProgressIndicator ===============================
  SliverToBoxAdapter sliverToBoxCircular() {
    return SliverToBoxAdapter(
      child: An.circular(),
    );
  }

  //===== product Category  ===========================================
  Widget sliverGridProduct() {
    return PagedSliverGrid<int, DatumProduct>(
      pagingController: controller.pagingController,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3,
        crossAxisSpacing: 0,
        mainAxisSpacing: 10,
      ),
      builderDelegate: PagedChildBuilderDelegate<DatumProduct>(
        itemBuilder: (context, product, index) {
          return ProductTow(
            onTap: () =>
                Get.toNamed(AppRoutes.productDetails, arguments: product.id),
            onTapFav: () {},
            product: product,
          );
        },
      ),
    );
  }
}
