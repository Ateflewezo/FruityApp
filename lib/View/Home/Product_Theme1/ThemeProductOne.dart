import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/Controller/Controller_Favorite.dart';
import '/Helper/routes/routes.dart';
import '/View/Home/Component/NotFoundProduct.dart';
import '/Controller/Controller_Category.dart';
import '/Model/model_category.dart';
import 'ProductOne.dart';
import 'package:get/get.dart';

class ThemeProductOne extends StatelessWidget {
  ControllerCategory controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ConditionalBuilder(
        condition: controller.listProductByCategory.isNotEmpty,
        builder: (context) => controller.pagingController.itemList.isEmpty
            ? sliverToBoxCircular()
            : sliverGridProduct(),
        fallback: (context) => NotFoundProduct(),
      );
    });
  }

  //===== CircularProgressIndicator =================================
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
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      builderDelegate: PagedChildBuilderDelegate<DatumProduct>(
        itemBuilder: (context, product, index) {
          return ProductOne(
            product: product,
            onTap: () =>
                Get.toNamed(AppRoutes.productDetails, arguments: product.id),
          );
        },
      ),
    );
  }
}
