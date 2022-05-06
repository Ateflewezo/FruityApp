import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:fruity/Api/Api_HomeApp.dart';
import 'package:fruity/Controller/Controller_HomeApp.dart';
import 'package:fruity/Model/model_category.dart';

class ControllerCategory extends GetxController {
  final PagingController<int, DatumProduct> pagingController =
      PagingController(firstPageKey: 0);
  RxList<DatumProduct> listProductByCategory = RxList<DatumProduct>();
  var isLoading = true.obs;

  //=========fetch Api Category=================================================
  Future<void> fetchApiCategory(
      {int parent, id, page, PagingController pagingController}) async {
    try {
      isLoading(true);
      var data = await ApiHomeApp.fetchDataCategory(
          parent: parent,
          id: id,
          page: page,
          pagingController: pagingController);
      listProductByCategory.clear();
      if (data != null) {
        listProductByCategory.assignAll(data.data.data);
      }
      return null;
    } finally {
      isLoading(false);
    }
  }

  //========= onTab Category ===================================================
  void onTabCategory(data) {
    pagingController.itemList = [];
    Get.find<ControllerCategory>().fetchApiCategory(
        id: data.id,
        parent: data.parentId,
        page: 1,
        pagingController: pagingController);
  }

  //========= onInit ===========================================================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchApiCategory(
        parent: Get.find<ControllerHomeApp>().categories[0].parentId,
        id: Get.find<ControllerHomeApp>().categories[0].id,
        page: 1,
        pagingController: pagingController);
    pagingController.addPageRequestListener((pageKey) {
      fetchApiCategory(page: pageKey, pagingController: pagingController);
    });
  }

  //========= onClose ===========================================================
  @override
  void onClose() {
    // TODO: implement onClose
    pagingController.dispose();
    super.onClose();
  }
}
