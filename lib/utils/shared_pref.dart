import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  setStringToSF(String name, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(name, value);
  }

  setIntToSF(String name, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(name, value);
  }

  setDoubleToSF(String name, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(name, value);
  }

  setBoolToSF(String name, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(name, value);
  }

  getStringValuesSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return String
    String stringValue = prefs.getString(name) ?? "";
    return stringValue;
  }

  getBoolValuesSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return bool
    bool boolValue = prefs.getBool(name) ?? false;
    return boolValue;
  }

  getIntValuesSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return int
    int intValue = prefs.getInt(name) ?? 0;
    return intValue;
  }

  getDoubleValuesSF(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
//Return double
    double doubleValue = prefs.getDouble(name) ?? 0.00;
    return doubleValue;
  }

  removeValues(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(name);
  }

  clearValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
