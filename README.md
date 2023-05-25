#fruity App
Online store for vegetables and fruits
It contains payment methods

![HomePage](https://user-images.githubusercontent.com/47438788/167224956-49abb858-d7dc-403b-8a76-dc952c8d2c9c.jpeg)
![shopping](https://user-images.githubusercontent.com/47438788/167224968-c59dd49a-b460-4587-a6a0-56810549dc36.jpeg)
![search](https://user-images.githubusercontent.com/47438788/167224983-e89c61a6-b72f-48e1-8456-bb83ede176b3.jpeg)
![favorite](https://user-images.githubusercontent.com/47438788/167224986-e5ed5bac-a53e-4c36-8c68-bdbabbb47ec1.jpeg)


📂lib
 │───main.dart  
 │───📂core  
 |   │──app_asset.dart
 |   │──app_color.dart
 |   │──app_data.dart
 |   │──app_extension.dart
 |   │──app_style.dart
 |   └──app_theme.dart
 └───📂src
     │────📂model
     │    │──bottom_navigation_item.dart
     |    │──AddProduct.dart
     |    └──MyOrder.dart
     |    │──Search.dart
     |    └──AddCart.dart
     └────📂view
     |    │───📂screen
     |    |   |──cart_screen.dart
     |    |   |──favorite_screen.dart
     |    |   |──home_screen.dart
     |    |   |──intro_screen.dart
     |    |   └──profile_screen.dart
     |    │───📂widget
     |    |   |──bottom_bar.dart
     │    |   |──cart_list_view.dart
     │    |   |──color_picker.dart
     │    |   |──counter_button.dart
     │    |   |──empty_widget.dart
     │    |   |──fade_in_animation.dart
     |    |   └──rating_bar.dart
     └────📂controller
          └──Product_controller.dart
           └──Cart_controller.dart
            └──Favorite.dart
