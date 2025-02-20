// import 'package:shared_preferences/shared_preferences.dart';

// class SharedpreferencesHelper {
//   static String userIdKey = "USERKEY";
//   static String userNameKey = "USERNAMEKEY";
//   static String userEmailKey = "USEREMAILKEY";
//   static String userImageKey = "USERIMAGEKEY";

//   Future<bool> saveUserId(String getUserId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userIdKey, getUserId);
//   }

//   Future<String?> getUserDisplayName() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(userNameKey);
//   }

//   Future<bool> saveUserDisplayName(String getUserName) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userNameKey, getUserName);
//   }

//   Future<bool> saveUserEmail(String getUserEmail) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userEmailKey, getUserEmail);
//   }

//   Future<bool> saveUserImage(String getUserImage) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.setString(userImageKey, getUserImage);
//   }
// }

import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferencesHelper {
  static String userIdKey = "USERKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";
  static String userImageKey = "USERIMAGEKEY";
  static String userAddressKey = "USERADDRESSKEY";

  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  Future<bool> saveUserAddress(String getUserAddress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userAddressKey, getUserAddress);
  }

  Future<String?> getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  Future<bool> saveUserDisplayName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImageKey, getUserImage);
  }

  Future<String> getUserDisplayNameOrDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey) ?? "Guest";
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(userIdKey);
  }
}
