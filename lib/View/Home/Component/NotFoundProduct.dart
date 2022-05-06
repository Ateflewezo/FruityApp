import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '/Helper/Constants.dart';
import '/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:get/get.dart';

class NotFoundProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/productempty.svg",width: 300),
            const SizedBox(height: 30),
            An.text("noProducts".tr,fontWeight: FontWeight.bold,size: fontSizeTitle),
          ],
        ),
      ),
    );
  }
}