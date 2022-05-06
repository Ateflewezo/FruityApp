import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fruity/Api/Api_confirmOrder.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Helper/WidgetShareApp/MyAwesomeDialog.dart';
import 'package:fruity/Helper/WidgetShareApp/WidgetShareApp.dart';
import 'package:fruity/Helper/colorApp.dart';
import 'package:fruity/Model/ModelDateTime.dart';
import 'package:fruity/Model/ModelModelRegions.dart';
import 'package:fruity/Model/ModelTimeDelivery.dart';
import 'package:fruity/Model/Modelgovernmnets.dart';

import 'Controller_Cart.dart';

class ControllerCheckout extends GetxController {
  int pageChanged = 0;
  RxString date = "".obs;
  // DateTime selectedDate = DateTime.now();

  DateTime selectedDate;
  DateTime _selectedDate;

  PageController pageController = PageController(initialPage: 0);

  TextEditingController name = new TextEditingController(
      text:
          getSave.read(userInfo) == null ? "" : getSave.read(userInfo)["name"]);
  TextEditingController email = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["email"]);
  TextEditingController phone = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["phone"]);
  TextEditingController block = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["block"]);
  TextEditingController street = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["street"]);
  TextEditingController gada = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["gada"] ?? "");
  TextEditingController homeNumber = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["bulding"]);
  TextEditingController turnNumber = new TextEditingController(text: "");
  TextEditingController apartmentNumber = new TextEditingController(
      text: getSave.read(userInfo) == null
          ? ""
          : getSave.read(userInfo)["Apartment_number"]);

  List<String> namesShippingWay = ["house".tr, "apartment".tr, "office".tr];

  var keyInFo = new GlobalKey<FormState>();
  var keyAddressHome = new GlobalKey<FormState>();
  var keyAddressApartment = new GlobalKey<FormState>();
  var keyAddressOffice = new GlobalKey<FormState>();

  void onPageChanged(value) {
    pageChanged = value;
    update();
  }

  //=== next Page ==============================================================
  void done() {
    if (selectedDate == null) {
      MyDialog.pleaseSelectDateDelivery();
    } else if (chooseTime == null) {
      MyDialog.pleaseSelectTimeDelivery();
    } else {
      Map<String, dynamic> bodyData = {
        "name": "${name.text}",
        "email": "${email.text}",
        "phone": "${phone.text}",
        "shippigType": "$typeShippingWay",
        "government_id": "$idGovernmnets",
        "region_id": "$idRegions",
        "block": "${block.text}",
        "street": "${street.text}",
        "gada": "${gada.text}",
        "bulding": "${homeNumber.text}",
        "Apartment_number": "${apartmentNumber.text}",
        "order_id": "${Get.find<ControllerCart>().orderInfo.id}",
        "arrivaldate": selectedDate.toString().substring(0, 10),
        "arrivaltime": "$chooseTime",
      };

      ApiConfirmOrder.postConfirmOrder(bodyData).then((value) {
        getSave.write(userInfo, bodyData);
      });
    }
  }

  //=== next Page ==============================================================
  void nextPage() {
    pageController.nextPage(
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  //=== previous Page ==========================================================
  void previousPage() {
    pageController.previousPage(
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  //=== To Page ================================================================
  void toPage(int pageNumber) {
    pageController.animateToPage(pageNumber,
        duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  //=== onInit ================================================================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCategories();
    fetchDateDelivery().then((value) {
      // fetchTimeDelivery(id: listDateDelivery[0].id);
    });
  }

  //=== dispose ================================================================
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
    name.dispose();
    phone.dispose();
    email.dispose();
    street.dispose();
    gada.dispose();
    homeNumber.dispose();
    turnNumber.dispose();
    apartmentNumber.dispose();
  }

  //============================================================================
  //==================================== نوع العنوان منزل / شقة / مكتب =========
  int typeShippingWay = 1;
  int isIndex = 0;
  void changeTab(int index) {
    isIndex = index;
    switch (index) {
      case 0:
        typeShippingWay = 1;
        break;
      case 1:
        typeShippingWay = 0;
        break;
      case 2:
        typeShippingWay = 2;
        break;
      default:
        typeShippingWay = 1;
        break;
    }
    update();
  }

  void getDataAddressFromUser() {
    switch (typeShippingWay) {
      case 1:
        if (keyAddressHome.currentState.validate()) {
          PleaseChooseProvince();
        }
        break;

      case 0:
        if (keyAddressApartment.currentState.validate()) {
          PleaseChooseProvince();
        }
        break;

      case 2:
        if (keyAddressOffice.currentState.validate()) {
          PleaseChooseProvince();
        }
        break;
    }
  }

  //=== اذا كان المستخدم لا يقوم باختيارالمحافظة والمنطقة تظهر هذا الرسالة ======
  void PleaseChooseProvince() {
    if (idGovernmnets == null) {
      MyDialog.pleaseSelectGovernorate();
    } else if (idRegions == null) {
      MyDialog.pleaseSelectArea();
    } else {
      nextPage();
    }
  }

  //============================================================================
  //===========================اختيار المحافظة والمنطقة ========================
  var isLoading = false.obs;
  String nameGovernmnets = "اختر المحافظة";
  String nameRegions = "اختر المنطقة";
  int idGovernmnets;
  int idRegions;
  RxList<governmnetsData> listGovernmnets = RxList<governmnetsData>();
  RxList<DataRegions> listRegions = RxList<DataRegions>();

  void onTapGovernmnets(governmnetsData item) {
    fetchRegions(id: item.id);
    idGovernmnets = item.id;
    update();
  }

  void onTapRegions(DataRegions item) {
    nameRegions = item.name;
    idRegions = item.id;
    update();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading(true); // is Loading true
      var category = await ApiConfirmOrder.fetchData();
      listGovernmnets.clear();
      if (category != null) {
        listGovernmnets.addAll(category);
      }
    } finally {
      isLoading(false); // is Loading false
    }
  }

  Future<void> fetchRegions({int id}) async {
    try {
      isLoading(false); // is Loading true
      var dataR = await ApiConfirmOrder.fetchRegions(id: id);
      listRegions.clear();
      if (dataR != null) {
        listRegions.addAll(dataR);
      }
    } finally {
      isLoading(false); // is Loading true
    }
  }

  //============================================================================
  //==========TimeDelivery======================================================
  int idDate;
  String chooseTime;
  RxList<DataTimeDelivery> listTimeDelivery = RxList<DataTimeDelivery>();
  RxList<DatumDate> listDateDelivery = RxList<DatumDate>();

  int isIndexDate;
  int isIndexTime;

  // void selectDate(int index,DatumDate item){
  //   isIndexDate = index;
  //   idDate = item.id;
  //   // fetchTimeDelivery(id: item.id,load: true);
  //   update();
  // }

  void selectTime(int index, DataTimeDelivery item) {
    isIndexTime = index;
    chooseTime = item.from + item.to;
    update();
  }

  Future<void> aliSelectDate(BuildContext context) async {
    final DateTime selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: ColorApp.primary(context),
              onPrimary: Colors.white,
              surface: ColorApp.primary(context),
              onSurface: Colors.black54,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child,
        );
      },
    );
    if (selected != null && selected != selectedDate) selectedDate = selected;
    fetchTimeDelivery(chooseTime: selectedDate, load: true);
    update();
  }

  //==== fetch Date Delivery ===================================================
  Future<void> fetchDateDelivery() async {
    try {
      isLoading(true);
      var date = await ApiConfirmOrder.fetchDateDelivery();
      listDateDelivery.clear();
      if (date != null) {
        listDateDelivery.addAll(date);
      }
    } finally {
      isLoading(false);
    }
  }

  //==== fetch Date Delivery ===================================================
  Future<void> fetchTimeDelivery(
      {DateTime chooseTime, bool load = true}) async {
    try {
      isLoading(load);
      var time = await ApiConfirmOrder.fetchTimeDelivery(dateTime: chooseTime);
      listTimeDelivery.clear();
      if (time != null) {
        listTimeDelivery.addAll(time);
      }
    } finally {
      isLoading(false);
    }
  }

  //============================================================================

}
