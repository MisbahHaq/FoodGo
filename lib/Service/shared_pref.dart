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

  // Save User ID
  Future<bool> saveUserId(String getUserId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userIdKey, getUserId);
  }

  // Get User Display Name
  Future<String?> getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey);
  }

  // Save User Display Name
  Future<bool> saveUserDisplayName(String getUserName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userNameKey, getUserName);
  }

  // Save User Email
  Future<bool> saveUserEmail(String getUserEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userEmailKey, getUserEmail);
  }

  // Save User Image URL
  Future<bool> saveUserImage(String getUserImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(userImageKey, getUserImage);
  }

  // Helper function to handle null checks for userName
  Future<String> getUserDisplayNameOrDefault() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(userNameKey) ?? "Guest"; // Default "Guest" if null
  }

  // Helper function to check if the user is logged in by verifying if userId exists
  Future<bool> isUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(userIdKey);
  }
}
