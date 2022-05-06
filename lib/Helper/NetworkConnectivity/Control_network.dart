import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ControllerNetwork extends GetxController {
  var connectionStatus = 1.obs;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  //==============================
  Future<void> inConnectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
    }
    return _updateConnectionStatus(result);
  }

  //==============================
  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionStatus.value = 1;
        break;

      case ConnectivityResult.mobile:
        connectionStatus.value = 2;
        break;

      case ConnectivityResult.none:
        connectionStatus.value = 0;
        break;

      default:
        Get.snackbar("Network", "message");
        break;
    }
  }

  //==============================
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  //==============================
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
