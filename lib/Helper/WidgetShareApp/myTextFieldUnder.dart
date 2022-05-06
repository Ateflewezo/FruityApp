import 'dart:core';
import 'package:flutter/material.dart';

class MyTextFieldUnder extends StatelessWidget {
  final String hint;
  final String labelText;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Function onClick;
  final Color colorfill;
  final Color colorborder;
  final int maxLines;
  final IconData suffixIcon;
  final Function onTapSuffixIcon;
  final bool filled;
  final double borderRadius;

  MyTextFieldUnder(
      {this.onTapSuffixIcon,
        this.suffixIcon,
        this.borderRadius,
        this.maxLines,
        this.filled,
        this.colorfill,
        this.colorborder,
        this.onClick,
        this.textInputType,
        this.textInputAction,
        this.hint,
        this.controller,
        this.labelText,
        this.prefixIcon,
        this.obscureText});

  String errorMessage(String srt) {
    switch (labelText){


      case "رقم الهاتف":
        return "قم بادخال رقم الهاتف";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      child: TextFormField(
        validator: (value) {if (value.isEmpty) return errorMessage(labelText);},
        onSaved: onClick,
        controller: controller,
        obscureText: obscureText == null ? obscureText == false : obscureText == true,

        //لون الايقونة
        cursorColor: Colors.black,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines,

        decoration: InputDecoration(
            suffixIcon: suffixIcon==null ? null: IconButton(
              icon:Icon(suffixIcon), onPressed: onTapSuffixIcon,
            ),
            hintText: hint,
            labelText: labelText,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            filled: filled == null ? false : true,
            fillColor: colorfill == null ? colorfill : colorfill,

            //========في حالة الظهور العادي=======================
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: colorborder == null ?
                  Colors.grey : colorborder, width: 1),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),

            //============في حالة الطغط تظهر هذا التاثيرات
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 3),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),

            //========في حالة اظهار خطاء=======================
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),

            //========في حالة الضغط اظهار خطاء=======================
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: borderRadius==null?BorderRadius.circular(0):BorderRadius.circular(borderRadius),
            ),
            errorStyle: TextStyle(color: Colors.red)),
      ),
    );
  }
}
