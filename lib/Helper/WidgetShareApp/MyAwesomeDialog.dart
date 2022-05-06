import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'Navigator.dart';

class MyDialog {
  static void pleaseSelectDateDelivery() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO_REVERSED,
      title: "Choosedate".tr,
    )..show();
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }

  static void pleaseSelectTimeDelivery() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO_REVERSED,
      title: "Choosetime".tr,
    )..show();
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }

  static void pleaseSelectGovernorate() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO_REVERSED,
      title: "ChooseProvince".tr,
    )..show();
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }

  static void pleaseSelectArea() {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO_REVERSED,
      title: "ChooseRegion".tr,
    )..show();
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }


  static void checkedStoke(text) {
    AwesomeDialog(
      dismissOnTouchOutside: false,
      context: Get.context,
      animType: AnimType.SCALE,
      dialogType: DialogType.INFO_REVERSED,
      title: text,
    )..show();
    new Future.delayed(new Duration(seconds: 2), () => Go.pop());
  }

}
