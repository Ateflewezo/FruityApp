import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import '/View/Home/Category_Theme1/ThemeCategoriesOne.dart';
import '/View/Home/Product_Theme1/ThemeProductOne.dart';
import '/Controller/Controller_HomeApp.dart';
import 'Category_Theme2/ThemeCategoriesTow.dart';
import 'Component/NameSections.dart';
import 'Component/TextTop.dart';
import 'Component/appBarHome.dart';
import 'Product_Theme2/ThemeProductTow.dart';

class ScreenHome extends GetView<ControllerHomeApp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        top: false,
        child: Obx((){
          return Scaffold(
            //====== appBarHome ==================================================
            appBar: appBarHome(context),

            //====== body ========================================================
            body: RefreshIndicator(
              onRefresh: () => controller.fetchApiHome(load: false),
              child: CustomScrollView(slivers: <Widget>[



                //====== Header ==================================================
                SliverToBoxAdapter(
                  child: Stack(
                  children: [
                    An.sliderImage(height: 200, list: controller.slider),
                    // Header()
                  ],
                )),

                //====== Text Header =============================================
                SliverToBoxAdapter(
                  child: buildContainer(context),
                ),

                //====== Theme Category ==========================================
                controller.info.categoryThem == "cat_1"
                    ? ThemeCategoriesOne()
                    : ThemeCategoriesTow(),

                //====== nameCategories =========================================
                GetBuilder<ControllerHomeApp>(
                  builder: (controller) {
                    return NameSections(name: "${controller.nameCategories}");
                  },
                ),

                //====== productThem =========================================
                controller.info.productThem == "product_1"
                    ? ThemeProductOne()
                    : ThemeProductTow(),
              ]),
            ),
          );
        }));
  }
}
