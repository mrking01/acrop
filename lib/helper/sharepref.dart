import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static SharedPreferences? _preferences;
  static const _email = 'email';
  static const _password = 'password';

  static Future init() async {
    return _preferences = await SharedPreferences.getInstance();
  }

  static Future removeemail() => _preferences!.remove(_email);

  static Future setemail(String value) async =>
      await _preferences!.setString(_email, value);
  static String? getemail() => _preferences!.getString(_email);
  static Future setpassword(String value) async => await _preferences!.setString(_password, value);
  static String? getpassword() => _preferences!.getString(_password);
  static Future removepassword()=> _preferences!.remove(_password);
}
