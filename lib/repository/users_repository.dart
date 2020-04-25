import 'package:djcateringapps/model/login/login.dart';
import 'package:djcateringapps/model/post/post_response.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

import 'base_url.dart';

class UsersRepository {
  Future<Login> usersLogin(username, password) async {
    try {
      final response = await http.post(BaseUrl.BASE_URL + 'login',
          body: {'username': username, 'password': password});
      if (response.statusCode == 200) {
        return Login.fromJson(convert.jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<PostResponse> usersRegister(username, password, name) async {
    try {
      final response = await http.post(BaseUrl.BASE_URL + 'register',
          body: {'username': username, 'password': password, 'name': name});
      if (response.statusCode == 200) {
        return PostResponse.fromJson(convert.jsonDecode(response.body));
      } else {
        throw Exception('Failed to load');
      }
    } catch (err) {
      throw Exception(err);
    }
  }
}
