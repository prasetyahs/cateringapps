import 'package:djcateringapps/model/login/data.dart';
import 'package:djcateringapps/model/order/MultipleResponseOrder.dart';
import 'package:djcateringapps/model/order/cart.dart';
import 'package:djcateringapps/model/order/order.dart';
import 'package:djcateringapps/model/order/sub_total.dart';
import 'package:djcateringapps/model/post/post_response.dart';
import 'package:djcateringapps/model/product/products.dart';
import 'package:djcateringapps/repository/order_repository.dart';
import 'package:djcateringapps/repository/product_repository.dart';
import 'package:djcateringapps/repository/shared_pref.dart';
import 'package:djcateringapps/repository/users_repository.dart';
import 'package:flutter/cupertino.dart';

class IndexProvider extends ChangeNotifier {
  ProductRepository _productRepository = ProductRepository();
  OrderRepository _orderRepository = OrderRepository();
  UsersRepository _usersRepository = UsersRepository();

  Products _products;
  Cart _cart;

  SubTotal _subTotal = SubTotal(subtotal: 0, message: "");

  SharedPref sharedPref = SharedPref();

  int _purchaseAmount = 0;

  int _numRowsCart = 0;

  bool _isEditProfile = true;

  get isEdit => _isEditProfile;

  setIsEdit(bool isEdit) {
    _isEditProfile = isEdit;
    notifyListeners();
  }

  Future<Order> addOrder(String idUsers, String idCart, String totalOrder,
      String dateRequest) async {
    Order order = await _orderRepository.addOrder(
        idUsers, idCart, totalOrder, dateRequest);
    return order;
  }

  setProductAll() {
    _productRepository.readAllProduct().then((value) {
      _products = Products(product: value.product, row: value.row);
      notifyListeners();
    });
  }

  setSubTotal(idUsers, idProduct, amount) {
    _subTotal = SubTotal(subtotal: 0, message: "");
    _orderRepository.countSubTotal(idUsers, idProduct, amount).then((value) {
      _subTotal = SubTotal(subtotal: value.subtotal, message: value.message);
      notifyListeners();
    });
  }

  addCart(idUsers, idProduct, purchaseAmount) async {
    await _orderRepository
        .addCart(idUsers, idProduct, purchaseAmount)
        .then((value) {
      _cart = value;
    });
    notifyListeners();
    return _cart;
  }

  readNumRowsCart(String idUsers) async {
    await _orderRepository.numRowsCart(idUsers).then((value) {
      _numRowsCart = value.result;
      // notifyListeners();
    });
  }

  set purchaseAmount(newValue) => _purchaseAmount = newValue;
  get numRowsCart => _numRowsCart;

  get cart => _cart;

  get products => _products;

  get subTotal => _subTotal;

  logout() => sharedPref.removeLogin('isLogin', 'users');

  users() async => Data.fromJson(await sharedPref.readDataUsers("users"));

  get purchaseAmount => _purchaseAmount;

  void incrementPurchase() {
    _purchaseAmount++;
    notifyListeners();
  }

  void decrementPurchase() {
    if (_purchaseAmount > 0) {
      _purchaseAmount--;
    }
    notifyListeners();
  }

  Future<MultipleResponseOrder> readOrderByUsers(String idUsers) async {
    MultipleResponseOrder response =
        await _orderRepository.readOrderByUser(idUsers);

    return response;
  }

  Future<PostResponse> editAccount(String username, String name, String email,
      String telp, String address, String idUsers) async {
    PostResponse postResponse = await _usersRepository.editAccount(
        username, name, email, telp, address, idUsers);
    return postResponse;
  }

  editSession(Data data) async {
    await sharedPref.saveDataUsers('users', data);
  }
}
