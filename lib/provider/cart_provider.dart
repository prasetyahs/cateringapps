import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/repository/order_repository.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  OrderRepository _orderRepository = OrderRepository();
  UsersCart _usersCart;
  Future<UsersCart> readCart(String idUsers) async {
    _usersCart = await _orderRepository.readCart(idUsers);
    return _usersCart;
  }

}
