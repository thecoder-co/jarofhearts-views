import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveId(String s) {
    prefs!.setString('id', s);
  }

  static String? getId() {
    return prefs!.getString('id');
  }
}
