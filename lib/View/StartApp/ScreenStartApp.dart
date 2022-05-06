import 'package:flutter/material.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';

class StartApp extends StatelessWidget {
  const StartApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: An.widthQuery(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/logoapp.png", width: 200),
            An.text("Welcome to Shpinge  app",
                size: fontSizeTitle, fontWeight: FontWeight.bold),
            SizedBox(height: 20),
            // An.circular(),
          ],
        ),
      ),
    );
  }
}
