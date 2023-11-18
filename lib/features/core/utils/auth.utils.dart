import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String authenticateAccountIdKey = 'authenticateAccountId';
  static const String authenticateKey = 'authenticate';

  // save  accessToken
  static Future<void> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(accessTokenKey, accessToken);
  }

  static Future<void> refreshAccessToken(String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(refreshTokenKey, refreshToken);
  }

  static Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(authenticateKey) ?? false;
  }

  static Future<String> getAuthenticateAccountId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(authenticateAccountIdKey) ?? "";
  }

  static Future<bool> setIsAuthenticate(String accountId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(authenticateAccountIdKey, accountId);
    return prefs.setBool(authenticateKey, true);
  }

  static Future<void> removeAuthenticate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(authenticateAccountIdKey);
    await prefs.remove(authenticateKey);
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
