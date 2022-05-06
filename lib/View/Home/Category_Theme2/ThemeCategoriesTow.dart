import 'package:flutter/material.dart';
import 'package:fruity/Controller/Controller_Category.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Helper/WidgetShareApp/CustomSliverDelegate.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Model/model_home.dart';
import 'BoxSectionTow.dart';
import 'package:get/get.dart';

class ThemeCategoriesTow extends StatelessWidget {
  ControllerHomeApp controller = Get.find();

  @override
  Widget build(BuildContext context) {
    // return buildSliverGrid();

    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: CustomSliverDelegate(
        expandedHeight: 330,
        child: Container(
          color: ColorApp.scaffold(context),
          padding: const EdgeInsets.only(top: 20),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.categories.length ?? 0,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.7,
              crossAxisSpacing: 0,
              mainAxisSpacing: 0,
            ),
            itemBuilder: (BuildContext context, int index) {
              Cateories dataCateories = controller.categories[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: BoxSectionTow(
                  onTap: () {
                    controller.getNameCategories(name: dataCateories.name);
                    Get.find<ControllerCategory>().onTabCategory(dataCateories);
                  },
                  name: dataCateories.name,
                  image: dataCateories.imagePath,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
