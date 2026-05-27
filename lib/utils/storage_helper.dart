import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_auth/constants/app_constants.dart';

class StorageHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Token Management
  static Future<void> saveToken(String token) async {
    await _prefs.setString(AppConstants.userTokenKey, token);
  }

  static String? getToken() {
    return _prefs.getString(AppConstants.userTokenKey);
  }

  static Future<void> removeToken() async {
    await _prefs.remove(AppConstants.userTokenKey);
  }

  // User Data Management
  static Future<void> saveUserData(String userData) async {
    await _prefs.setString(AppConstants.userDataKey, userData);
  }

  static String? getUserData() {
    return _prefs.getString(AppConstants.userDataKey);
  }

  static Future<void> removeUserData() async {
    await _prefs.remove(AppConstants.userDataKey);
  }

  // Login Status
  static Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(AppConstants.isLoggedInKey, value);
  }

  static bool isLoggedIn() {
    return _prefs.getBool(AppConstants.isLoggedInKey) ?? false;
  }

  // Remember Me
  static Future<void> setRememberMe(bool value) async {
    await _prefs.setBool(AppConstants.rememberMeKey, value);
  }

  static bool getRememberMe() {
    return _prefs.getBool(AppConstants.rememberMeKey) ?? false;
  }

  // Clear All
  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
