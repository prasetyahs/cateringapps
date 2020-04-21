import 'package:djcateringapps/model/product/products.dart';
import 'package:djcateringapps/repository/product_repository.dart';
import 'package:djcateringapps/repository/shared_pref.dart';
import 'package:flutter/cupertino.dart';

class IndexProvider extends ChangeNotifier {
  ProductRepository _productRepository = ProductRepository();
  Products _products;
  SharedPref sharedPref = SharedPref();
  setProductAll() {
    _productRepository.readAllProduct().then((value) {
      _products = Products(product: value.product, row: value.row);
      notifyListeners();
    });
  }

  get products => _products;

  logout() => sharedPref.removeLogin('isLogin', 'users');
}
