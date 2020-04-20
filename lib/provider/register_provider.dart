import 'package:djcateringapps/model/post/post_response.dart';
import 'package:djcateringapps/repository/users_repository.dart';
import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  final _usersRepo = UsersRepository();
  PostResponse _postResponse = PostResponse();

  usersRegister(String username, String password, String name) {
    _usersRepo.usersRegister(username, password, name).then((value) {
      _postResponse = value;
      notifyListeners();
    });
    notifyListeners();
  }

  get postResponse => _postResponse;
}
