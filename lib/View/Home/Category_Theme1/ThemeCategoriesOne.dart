import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_Category.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Helper/WidgetShareApp/CustomSliverDelegate.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'BoxSectionOne.dart';
import 'package:get/get.dart';

class ThemeCategoriesOne extends StatelessWidget {
  ControllerHomeApp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: CustomSliverDelegate(
        expandedHeight: 100,
        child: Container(child: buildContainer(context)),
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return Container(
      color: ColorApp.whiteColor(context),
      padding: const EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 15),
      // height: 95,
      child: ListView.builder(
        itemCount: controller.categories.length,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          var dataCategory = controller.categories[index];
          return BoxSectionOne(
            name: dataCategory.name,
            image: dataCategory.imagePath,
            onTap: () {
              controller.getNameCategories(name: dataCategory.name);
              Get.find<ControllerCategory>().onTabCategory(dataCategory);
            },
          );
        },
      ),
    );
  }
}
