import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  static const DARK_THEME_STATUS = "DARK_THEME_STATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(DARK_THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(DARK_THEME_STATUS) ?? false;
  }
}
