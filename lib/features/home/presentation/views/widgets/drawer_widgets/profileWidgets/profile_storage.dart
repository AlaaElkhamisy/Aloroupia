import 'package:shared_preferences/shared_preferences.dart';

class ProfilePictureStorage {
  static const _key = 'profile_picture_path';

  // Save the image path to SharedPreferences
  static Future<void> saveImagePath(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, path);
  }

  // Load the saved image path
  static Future<String?> loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  // Clear the saved image path
  static Future<void> clearImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
