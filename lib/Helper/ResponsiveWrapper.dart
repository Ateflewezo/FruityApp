import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

Widget responsiveWrapper(BuildContext context, widget) {
  return ResponsiveWrapper.builder(
      BouncingScrollWrapper.builder(context, widget),
      maxWidth: 2460,
      minWidth: 450,
      defaultScale: true,
      breakpoints: [
        ResponsiveBreakpoint.resize(450, name: MOBILE),
        ResponsiveBreakpoint.autoScale(800, name: TABLET),
        ResponsiveBreakpoint.autoScale(1000, name: TABLET),
        ResponsiveBreakpoint.resize(1200, name: DESKTOP),
        ResponsiveBreakpoint.autoScale(2460, name: "4K"),
      ],
      background: Container(color: Color(0xFFF5F5F5)));
}
