import 'package:flutter/material.dart';
import '/Controller/Controller_search.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';

class BoxSearch extends StatelessWidget {
  SearchController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: An.widthQuery(),
      height: 45,
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.search,
              color: Colors.blueGrey,
              size: 30,
            ),
          ),
          Flexible(
            child: new TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onChanged: controller.onChanged,
              controller: controller.controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "ابحث عن منتجك",
                  suffixIcon: IconButton(
                      onPressed: ()=>controller.clearResult(),
                      icon: Icon(Icons.clear))),
            ),
          )
        ],
      ),
    );
  }
}
