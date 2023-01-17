
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefs {
  static late SharedPreferences _sharedPrefs;

  static Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  static bool isLogIn() => _sharedPrefs.getBool("isLogIn") ?? false;

  static setLogIn(bool value) {
    _sharedPrefs.setBool("isLogIn", value);
  }

  static bool isOnBoardVisited() =>
      _sharedPrefs.getBool("isOnBoardVisited") ?? false;

  static setIsOnBoardVisited(bool value) {
    _sharedPrefs.setBool("isOnBoardVisited", value);
  }
}
