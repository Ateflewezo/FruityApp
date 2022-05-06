import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:fruity/Model/model_category.dart';

class ControllerFavorites extends GetxController {
  var favoritesList = List<DatumProduct>().obs;

  void addFavorite({DatumProduct product}) {
    favoritesList.add(product);
    update();
  }

  void removeFavorite({DatumProduct product}) {
    favoritesList.removeWhere((element) => element.id == product.id);
    update();
  }

  bool isFavourite(int id) => favoritesList.any((element) => element.id == id);

  @override
  void onInit() {
    List storedTodos = GetStorage().read<List>('Favorites');
    if (!storedTodos.isNull) {
      favoritesList =
          storedTodos.map((e) => DatumProduct.fromJson(e)).toList().obs;
    }
    ever(favoritesList, (_) {
      GetStorage().write('Favorites', favoritesList.toList());
    });
    super.onInit();
  }
}
