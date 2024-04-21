import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Remote/Model/News_Model.dart';

class Storage {
  static Future<List<Article>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedTasks = prefs.getStringList('article');
    if (encodedTasks == null) {
      return [];
    }
    return encodedTasks
        .map((task) => Article.fromJson(jsonDecode(task)))
        .toList();
  }

  static Future<bool> getDarkModePreference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkMode') ?? false; // Default to light mode
  }

  static Future<void> setDarkModePreference(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMode', isDarkMode);
    Get.isDarkMode;
  }

  static Future<void> saveTasks(List<Article> artdicle) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedTasks = artdicle
        .map((articlesdnjd) => jsonEncode(articlesdnjd.toJson()))
        .toList();
    await prefs.setStringList('article', encodedTasks);
  }
}
