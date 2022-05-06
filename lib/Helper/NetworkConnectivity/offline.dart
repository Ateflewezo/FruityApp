import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';

class offline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.wifi),
          Text("لايوجد اتصال بالانترنت"),
          An.text("لسه هعدل التصميم 🤣")
        ],
      ),
    );
  }
}
