import 'package:get/get.dart';
import '/Api/Api_MyOrder.dart';
import '/Model/ModelOrderDetails.dart';

class ControllerOrderDetails extends GetxController {
  Future futureDetails;
  List<ProductOrder> listProductOrder = [];
  DeliveryInfo deliveryInfo;
  InfoOrder info;


  Future<void> fetchApiOrderDetails({int id}) async {
    try {
      var dataO = await ApiMyOrder.fetchOrderDetails(id: id);
      listProductOrder.clear();
      if (dataO != null) {
        listProductOrder.addAll(dataO.data.products);
        deliveryInfo = dataO.data.deliveryInfo;
        info = dataO.data.info;
      }
    } finally {}
  }


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    futureDetails = fetchApiOrderDetails(id: Get.arguments);
  }

}
