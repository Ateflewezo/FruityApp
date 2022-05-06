import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Helper/routes/routes.dart';
import 'package:fruity/Model/model_home.dart';
import 'package:loading_indicator/loading_indicator.dart';

class An {
  static widthQuery() => MediaQuery.of(Get.context).size.width;
  static heightQuery() => MediaQuery.of(Get.context).size.height;
  static var orientation = MediaQuery.of(Get.context).orientation;

  //==== button Elevated =======================================================
  static Widget buttonElevated({
    @required String name,
    @required VoidCallback onPressed,
    onLongPress,
    double elevation = 0,
    double radius = 0,
    double fontSize,
    double width = 100,
    double height = 50,
    Color colorPrimary,
    shadowColor,
    colorText,
    FontWeight fontWeight,
    String fontFamily,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        onLongPress: onLongPress,
        child: Text("$name",
            style: TextStyle(color: colorText, fontFamily: fontFamily)),
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          primary: colorPrimary,
          alignment: Alignment.center,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }

  //====buttonElevated Icon=====================================================
  static Widget buttonElevatedIcon({
    @required String name,
    @required VoidCallback onPressed,
    @required IconData icon,
    onLongPress,
    double elevation = 0,
    double radius = 0,
    double fontSize,
    double width = 100,
    double height = 50,
    Color colorPrimary,
    String fontFamily,
    shadowColor,
    colorText,
    FontWeight fontWeight,
    Color colorIcon,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          primary: colorPrimary,
          alignment: Alignment.center,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          textStyle: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
        ),
        label: Text("$name",
            style: TextStyle(color: colorText, fontFamily: fontFamily)),
        icon: Icon(icon, color: colorIcon),
      ),
    );
  }

  //============= showSnackBar =================================================
  static showSnackBar(String title, {BuildContext context, Color color}) {
    final snackBar =
        SnackBar(content: Text("$title"), elevation: 0, backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //============= Widget Text ==================================================
  static text(String text,
      {double size,
      double height,
      Color color,
      String family,
      FontWeight fontWeight,
      TextAlign textAlign,
      Function onTap,
      int maxLines,
      TextOverflow overflow,
      TextDecoration decoration}) {
    return InkWell(
      onTap: onTap == null ? null : onTap,
      child: Text("$text",
          textAlign: textAlign,
          overflow: overflow == null ? null : overflow,
          maxLines: maxLines == null ? null : maxLines,
          style: TextStyle(
              fontSize: size,
              color: color == null ? Colors.black : color,
              fontFamily: family,
              height: height,
              fontWeight: fontWeight,
              decoration: decoration)),
    );
  }

  //============= bottomSheet ==================================================
  static bottomSheet({Widget widget}) {
    showModalBottomSheet(
      context: Get.context,
      builder: (context) {
        return widget;
      },
    );
  }

  //============= bottomSheet ==================================================
  static void showDialogs(
      {@required Widget widget,
      double radius = 0,
      double elevation = 0,
      Color color = Colors.white,
      bool barrierDismissible = true,
      BuildContext context}) {
    showDialog(
        context: Get.context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return Dialog(
            elevation: elevation,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius)), //this right here
            child: widget,
          );
        });
  }

  //============= viewImage ====================================================
  static void viewImage({
    @required String image,
    double width,
    height,
    Color colorBorder = Colors.white,
  }) {
    showDialogs(
        barrierDismissible: true,
        widget: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: colorBorder),
          ),
          child: cachedNetworkImage(image),
        ));
  }

  //============= toast ========================================================
  static toast({
    double radius = 0,
    double height = 100,
    Color color = Colors.white,
    @required Widget widget,
  }) {
    showDialog(
      context: Get.context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          child: Container(
            height: height,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(radius)),
            child: widget,
          ),
        );
      },
    );
    new Future.delayed(new Duration(seconds: 1), () {
      Navigator.pop(Get.context); //pop dialog
    });
  }

  //============= dropdownButton ===============================================
  static Widget dropdownButton({
    @required List items,
    @required Function onChanged,
    @required var value,
    String hint = "اكتب هنا نص الــ Hint",
    double width = double.infinity,
    double height = 50,
    double radius = 0,
    Color colorBox = Colors.white,
    Color colorList = Colors.white,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: colorBox,
          borderRadius: BorderRadius.circular(radius),
          border:
              Border.all(width: 0.5, color: ColorApp.subTitle(Get.context))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Center(
        child: DropdownButton(
          elevation: 0,
          hint: Text("$hint"),

          // الخط اللي بيظهر تحت DropdownButton
          underline: SizedBox(),
          isExpanded: true,
          // اللي بياخد عرض الصفحة بشكل كام ل
          iconSize: 30,

          dropdownColor: colorList,
          items: items.map((e) {
            return new DropdownMenuItem<dynamic>(
              value: e,
              child: new Text(
                e,
                style: new TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          value: value,
        ),
      ),
    );
  }

  static Widget cachedNetworkImage(String image) {
    return CachedNetworkImage(
      imageUrl: "$image",
      fit: BoxFit.fill,
      placeholder: (context, url) => Container(
        width: 50,
        height: 50,
        child: LoadingIndicator(
            indicatorType: Indicator.ballScale, color: Colors.blue),
      ),
      errorWidget: (context, url, error) => Center(
        child: Text("لايوجد صورة"),
      ),
    );
  }

  static Widget sliderImage({double height, List<SliderData> list}) {
    return Container(
      height: 200,
      width: An.widthQuery(),
      child: CarouselSlider.builder(
        itemCount: list.length ?? 0,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          SliderData item = list[index];
          return GestureDetector(
            onTap: () {
              item.showNumber == null
                  ? null
                  : Get.toNamed(AppRoutes.productDetails,
                      arguments: item.showNumber);
            },
            child: Container(
                width: An.widthQuery(),
                child: An.cachedNetworkImage(list[index].imagePath)),
          );
        },
        options: CarouselOptions(
          autoPlay: list?.length == 1 ? false : true,
          enlargeCenterPage: false,
          viewportFraction: 0.999,
          aspectRatio: 1,
          initialPage: 1,
        ),
      ),
    );
  }

  static BoxShadow shadow({Color color}) {
    return BoxShadow(
      color: color,
      spreadRadius: 1,
      blurRadius: 3,
      offset: Offset(0, 3), // changes position of shadow
    );
  }

  static Widget circular() {
    return Center(
        child: GetPlatform.isIOS
            ? CupertinoActivityIndicator()
            : CircularProgressIndicator());
  }
}
