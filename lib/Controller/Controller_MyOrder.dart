import 'package:get/get.dart';
import '/Api/Api_MyOrder.dart';
import '/Model/ModelMyOrders.dart';

class ControllerMyOrder extends GetxController {
  List<DatumMyOrder> lisOrder = [];
  List<DatumMyOrder> lisOrderSearch = [];
  var isLoading = true.obs;
  Future futureApiOrder;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    futureApiOrder = fetchApiMyOrder().then((value){
      lisOrderSearch = lisOrder;
    });
  }

  Future<void> fetchApiMyOrder() async {
    try {
      isLoading(true);
      var order = await ApiMyOrder.fetchMyOrder();
      if (order != null) {
        lisOrderSearch = order.data;
        lisOrder= order.data;
      }
    } finally {
      isLoading(false);
    }
    update();
  }


  void changeSearch(value){
    lisOrderSearch = lisOrder.where((element){
      var not = element.orderNumber.toLowerCase();
      return not.contains(value);
    }).toList();
    update();
  }


}
