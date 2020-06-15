import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/model/login/data.dart';
import 'package:djcateringapps/model/order/cart.dart';
import 'package:djcateringapps/model/order/num_rows_cart.dart';
import 'package:djcateringapps/model/order/order.dart';
import 'package:djcateringapps/model/order/sub_total.dart';
import 'package:djcateringapps/repository/order_repository.dart';
import 'package:djcateringapps/repository/shared_pref.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  OrderRepository _orderRepository = OrderRepository();
  UsersCart _usersCart;
  SharedPref sharedPref = SharedPref();
  int _amount = 0;

  double _subTotal = 0;

  Future<UsersCart> readCart(String idUsers) async {
    _usersCart = await _orderRepository.readCart(idUsers);
    return _usersCart;
  }

  Future<Cart> deleteCart(String idCart,String idUsers) async {
    Cart _cart = await _orderRepository.deleteCart(idCart,idUsers);
    notifyListeners();
    return _cart;
  }

  users() async => Data.fromJson(await sharedPref.readDataUsers("users"));

  Future<Cart> editAmountcart(String idCart, String amount) async {
    Cart _cart = await _orderRepository.editAmountCart(idCart, amount);

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

  Future<SubTotal> subTotalAll(String idUsers) async {
    SubTotal subTotal = await _orderRepository.subTotalAll(idUsers);

    return subTotal;
  }

  void setSubTotal(double val) {
    _subTotal = val;
    notifyListeners();
  }

  get subTotal => _subTotal;

  Future<NumRowsCart> totalProductCart(String idUsers) async {
    NumRowsCart totalProduct = await _orderRepository.totalProductCart(idUsers);
    return totalProduct;
  }

  Future<Order> addOrder(String idUsers, String idCart,String totalOrder) async {
    Order order = await _orderRepository.addOrder(idUsers, idCart,totalOrder);
    notifyListeners();
    return order;
  }
}
