import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class SharedPref {
  saveDataUsers(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  saveAuth(String key, value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<bool> readAuth(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }

  readDataUsers(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.getString(key));
  }

  removeLogin(String key,String key2) async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
    prefs.remove(key2);
  }
}
