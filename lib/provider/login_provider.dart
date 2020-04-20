import 'package:djcateringapps/model/login/login.dart';
import 'package:djcateringapps/repository/shared_pref.dart';
import 'package:djcateringapps/repository/users_repository.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier {
  UsersRepository _usersRepository = UsersRepository();
  SharedPref sharedPref = SharedPref();
  Login _login = Login();
  String _message = "";

  Future<Login> onLogin(username, password) async {
    await _usersRepository.usersLogin(username, password).then((value) {
      if (value.auth) {
        _login.auth = value.auth;
        _login.data = value.data;
        _message = "";
        sharedPref.saveAuth("isLogin", value.auth);
        sharedPref.saveDataUsers('users', value.data);
      } else {
        _message = "Username dan Password Salah. Silahkan Coba Lagi !";
      }
    });
    notifyListeners();
    return _login;
  }

  get message => _message;

  get loginData => _login;

  Future<bool> auth() async => await sharedPref.readAuth('isLogin') != null
      ? await sharedPref.readAuth('isLogin')
      : false;

  logout() => sharedPref.removeLogin('isLogin', 'users');
}
