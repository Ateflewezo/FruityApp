import 'package:get/get.dart';
import 'package:fruity/Api/Api_confirmOrder.dart';
import 'package:fruity/Helper/Constants.dart';
import 'package:fruity/Controller/Controller_checkout.dart';
import '/Helper/routes/routes.dart';
import 'Controller_Cart.dart';

class ControllerPayment extends GetxController {
  int groupValue = 1;
  int typePayment = 1;
  var isLoading = true.obs;
  ControllerCheckout controlCheckout = Get.find();

  void onChanged(value) {
    groupValue = value;
    typePayment = value;
    update();
  }

  void payment() {
    if (typePayment == 1) {
      return cashPayment();
    } else {
      kentPayment();
    }
  }

  void kentPayment() {
    Get.toNamed(AppRoutes.keyNet);
  }

  void cashPayment() {
    Map<String, dynamic> body = {
      'order_id': '${Get.find<ControllerCart>().orderInfo.id}',
      'governments_id': '1',
      'region_id': '1',
      'block': '${controlCheckout.block.text}',
      'street_name': '${controlCheckout.street.text}',
      'building': '${controlCheckout.homeNumber.text}',
      'jada': '${controlCheckout.gada.text}',
      'user_mobile': '${controlCheckout.phone.text}',
      'total_price': '${getSave.read(confirmSave)["data"]["TotalPrice"]}',
      'delivery_time':
          '${controlCheckout.selectedDate.toString().substring(0, 10)}',
      'delivery_date_time': '${controlCheckout.chooseTime}',
      'payment_method': '1',
      'totaShippingCost':
          '${getSave.read(confirmSave)["data"]["totaShippingCost"]}',
    };
    ApiConfirmOrder.postSubmitOrder(body).then((value) {
      Get.find<ControllerCart>().refreshCart();
    });
  }
}
