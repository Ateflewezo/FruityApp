import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'ar_AE.dart';
import 'en_US.dart';

class LocalizationService extends Translations {
  final box = GetStorage();
  static final locale = Locale('en', "US");
  static final fallBackLocale = Locale("en", "US");

  static final langs = ["English", "Arabic"];
  static final locales = [
    Locale("en", "US"),
    Locale("ar", "AE"),
  ];

  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": enUS,
        "ar_AE": arAE,
      };

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    box.write("lang", lang);
    Get.updateLocale(locale);
  }

  Locale getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }

  Locale getCurrentLocale() {
    Locale defaultLocale;
    if (box.read("lang") != null) {
      final locale = getLocaleFromLanguage(box.read("lang"));
      defaultLocale = locale;
    } else {
      defaultLocale = Get.deviceLocale.toString() == "ar_EG"
          ? Locale('ar', 'AE')
          : Locale('en', 'US');
    }
    return defaultLocale;
  }

  String getCurrentLang() {
    return box.read("lang") != null ? box.read("lang") : "English";
  }
}
