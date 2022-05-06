import 'package:flutter/material.dart';
import 'package:fruity/Helper/WidgetShareApp/Navigator.dart';
import 'package:fruity/View/Home/ScreenHome.dart';
import 'package:fruity/View/Navbar/BottomNavigationBar.dart';

class splashScreen extends StatefulWidget {
  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      Go.to(HomeNavigationBar());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
