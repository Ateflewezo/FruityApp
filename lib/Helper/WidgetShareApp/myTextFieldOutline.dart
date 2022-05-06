import 'dart:core';
import 'package:flutter/material.dart';

import '../Constants.dart';

class MyTextFieldOutline extends StatelessWidget {
  final String hint;
  final String labelText;
  final String initialvalue;
  final IconData prefixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Function onSaved;
  final Color colorfill;
  final Color colorborder;
  final int maxLines;
  final int maxLength;
  final IconData suffixIcon;
  final Function onTapSuffixIcon;
  final Function onChanged;
  final bool filled;
  final double borderRadius;


  MyTextFieldOutline({this.maxLength,this.onChanged,this.hint, this.labelText, this.initialvalue,
      this.prefixIcon, this.controller, this.obscureText, this.textInputAction,
      this.textInputType, this.onSaved, this.colorfill, this.colorborder,
      this.maxLines, this.suffixIcon, this.onTapSuffixIcon, this.filled,
      this.borderRadius});

  String _errorMessage(String srt) {
    switch (labelText) {
      case "الرقم المدني":
        return "$inputRequired";
        break;

      case "كلمة المرور":
        return "$inputRequired";
        break;

      case "اسم المستخدم":
        return "$inputRequired";
        break;

      case "رقم الهاتف":
        return "$inputRequired";
        break;

      case "القطعة":
        return "$inputRequired";
        break;

      case "الشارع":
        return "$inputRequired";
        break;

      case "رقم المنزل":
        return "$inputRequired";
        break;

      case "رقم العمارة":
        return "$inputRequired";
        break;

      case "رقم المجمع":
        return "$inputRequired";
        break;

      case "رقم المكتب":
        return "$inputRequired";
        break;


      case "رقم الدور":
        return "$inputRequired";
        break;

      case "رقم الشقة":
        return "$inputRequired";
        break;

      case "User Name":
        return "$inputRequired";
        break;

      case "Email":
        return "$inputRequired";
        break;

     case "phone Number":
        return "$inputRequired";
        break;

     case "block":
        return "$inputRequired";
        break;

     case "street":
        return "$inputRequired";
        break;


     case "turn Number":
        return "$inputRequired";
        break;


     case "house Number":
        return "$inputRequired";
        break;


     case "Apartment Number":
        return "$inputRequired";
        break;


     case "building Number":
        return "$inputRequired";
        break;

     case "collector Number":
        return "$inputRequired";
        break;

     case "Office Number":
        return "$inputRequired";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child: TextFormField(
        validator: (value) {if (value.isEmpty) return _errorMessage(labelText);},
        onSaved: onSaved,
        controller: controller,
        onChanged:onChanged,
        obscureText: obscureText == null ? obscureText == false : obscureText == true,
        //لون الايقونة
        cursorColor: Colors.black,
        textInputAction: textInputAction,
        keyboardType: textInputType,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
            suffixIcon: suffixIcon == null
                ? null
                : IconButton(
                    icon: Icon(suffixIcon),
                    onPressed: onTapSuffixIcon,
                  ),
            hintText: hint,
            hintStyle: TextStyle(fontSize: fontSizeSubTitle),
            labelText: labelText,
            labelStyle: TextStyle(fontSize: fontSizeSubTitle),
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
            filled: filled == null ? false : true,
            fillColor: colorfill == null ? colorfill : colorfill,

            //========في حالة الظهور العادي=======================
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: colorborder == null ? Colors.grey : colorborder,
                  width: 0.5),
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(0)
                  : BorderRadius.circular(borderRadius),
            ),

            //============في حالة الطغط تظهر هذا التاثيرات
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent, width: 1),
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(0)
                  : BorderRadius.circular(borderRadius),
            ),

            //========في حالة اظهار خطاء=======================
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(0)
                  : BorderRadius.circular(borderRadius),
            ),

            //========في حالة الضغط اظهار خطاء=======================
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: borderRadius == null
                  ? BorderRadius.circular(0)
                  : BorderRadius.circular(borderRadius),
            ),
            errorStyle: TextStyle(color: Colors.red)),
      ),
    );
  }
}
