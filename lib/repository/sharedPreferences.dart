import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop0koa_frontend/constants/app_constants.dart';

class sharedpreferencesStorage {
  final prefs = SharedPreferences.getInstance();

  static Future<void> storeToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.TOKEN_KEY, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(AppConstants.TOKEN_KEY);
  }

  static Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(AppConstants.TOKEN_KEY);
  }
}
