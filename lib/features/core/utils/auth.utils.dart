import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String isLoginKey = 'isLogin';

  // save  accessToken
  static Future<void> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, accessToken);
  }

  static Future<void> refreshAccessToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(refreshTokenKey, refreshToken);
  }

   static Future<void> isLogin(String isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(isLoginKey, isLogin);
  }


  // get accessToken
  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(accessTokenKey);
  }

  //delete accessToken
  static Future<void> removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(accessTokenKey);
  }
}