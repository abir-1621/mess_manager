import 'package:flutter/cupertino.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _currentLang = const Locale('bn', 'BD');

  Locale get currentLang => _currentLang;

  List<Locale> supportedLang = const [
    Locale('bn', 'BD'),
    Locale('en', 'US'),
  ];

  void changeLang(isBn) {
    _currentLang = isBn ? const Locale('bn', 'BD') : const Locale('en', 'US');
    notifyListeners();
  }
}
