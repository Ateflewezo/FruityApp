
// ======== font Family All App ===========

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

final fontFamily = "DroidSans";
final fontPriceBefore = "LatoLight";
final fontPriceMain = "LatoRegular";

final getSave = GetStorage();
final String confirmSave = "dataConfirm";
final String submitSave = "submitSave";
final String userInfo = "userInfo";

final String urlApi = "https://machltcom.com/api";
final String inputRequired = "ThisRequired".tr;

// ======== font Size All App ===========
final double fontSizeTitle = 20;
final double fontSizeNameProductOut = 14;
final double fontSizeSubTitle = 15;
final double fontSizeKD = 13;
final double fontSizePrice = 16;

// ======== size Box Services  ===========
final double heightSliderImageHomeApp = 200;
final double heightBoxProduct = 320;

final String imageTest = "https://z.nooncdn.com/products/tr:n-t_240/v1602771108/N41059747A_1.jpg";
final String imageTest2 = "https://k.nooncdn.com/cms/pages/20210301/e877bb2caae7b676248d222d388087ef/ar_strip-01.gif";
final String imageTest3 = "https://images.pexels.com/photos/3534632/pexels-photo-3534632.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";



const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  DeliveryTime,
  AddAddress,
  Summary,
}



