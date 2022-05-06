import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/Controller/Controller_search.dart';
import '/Helper/colorApp.dart';
import 'Component/BoxSearch.dart';
import 'Component/SearchResultList.dart';

class ScreenSearch extends StatelessWidget {
  final controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {FocusScope.of(context).requestFocus(FocusNode());},
      child: Scaffold(
        backgroundColor:ColorApp.scaffold(context),


        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorApp.whiteColor(context),
          leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios, color: ColorApp.blackColor(context))),
          title: BoxSearch(),
        ),

        body: Column(
          children: <Widget>[GetBuilder<SearchController>(builder: (_) => SearchResultList())
          ],
        ),
      ),
    );
  }
}