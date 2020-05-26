import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/model/login/data.dart';
import 'package:djcateringapps/model/order/cart.dart';
import 'package:djcateringapps/repository/order_repository.dart';
import 'package:djcateringapps/repository/shared_pref.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  OrderRepository _orderRepository = OrderRepository();
  UsersCart _usersCart;
  SharedPref sharedPref = SharedPref();
  int _amount = 0;

  Future<UsersCart> readCart(String idUsers) async {
    _usersCart = await _orderRepository.readCart(idUsers);
    return _usersCart;
  }

  Future<Cart> deleteCart(String idCart) async {
    Cart _cart = await _orderRepository.deleteCart(idCart);
    notifyListeners();
    return _cart;
  }

  users() async => Data.fromJson(await sharedPref.readDataUsers("users"));

  Future<Cart> editAmountcart(String idCart, String amount) async {
    Cart _cart = await _orderRepository.editAmountCart(idCart, amount);
    notifyListeners();
    return _cart;
  }

  void amountIncrement(String lastAmount) {
    _amount = int.parse(lastAmount);
    _amount++;
    notifyListeners();
  }

  void amountDecrement(String lastAmount) {
    _amount = int.parse(lastAmount);
    _amount--;
    notifyListeners();
  }

  get amount => _amount;
}
