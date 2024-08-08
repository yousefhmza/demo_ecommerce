import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'ar.dart';
import 'en.dart';

class L10n extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {"ar": arabic, "en": english};

  static final List<Locale> supportedLocales = [
    const Locale("en", ""),
    const Locale("ar", ""),
  ];

  static const List<LocalizationsDelegate> localizationDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static Locale? setFallbackLocale(deviceLocale, _) {
    final List<String> supportedLangCodes = supportedLocales.map((e) => e.languageCode).toList();
    final String deviceLangCode = deviceLocale.toString().substring(0, 2);
    if (!supportedLangCodes.contains(deviceLangCode)) return supportedLocales[0];
    return null;
  }

  static bool isAr(BuildContext context) => Localizations.localeOf(context).languageCode == 'ar';
}
