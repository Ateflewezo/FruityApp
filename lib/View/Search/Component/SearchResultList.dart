import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import '/Controller/Controller_search.dart';
import 'boxItemSearch.dart';

class SearchResultList extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    switch (controller.status) {
      case Status.loaded:
        return Expanded(
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.searchResults.length,
                itemBuilder: (context, index) =>
                    boxItemSearch(context, index, controller)));

        break;
      case Status.loading:
        return Center(child: CircularProgressIndicator());
        break;
      case Status.error:
        return Center(child: Text('error'));
        break;
      case Status.empty:
        return Center(child: Text('empty'));
        break;
      case Status.idle:
        return Center(
          child: Column(
            children: [
              SizedBox(height: An.widthQuery() * 0.5),
              SizedBox(
                width: 100,
                height: 100,
                child: SvgPicture.asset(
                  "assets/images/iconSearch.svg",
                  color: ColorApp.subTitle(context),
                ),
              ),
              SizedBox(height: 10),
              An.text("ابدا البحث الان",
                  size: fontSizeTitle + 5,
                  fontWeight: FontWeight.bold,
                  color: ColorApp.subTitle(context))
            ],
          ),
        );
        break;

      default:
    }
  }
}
