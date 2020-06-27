import 'package:djcateringapps/model/product/products.dart';
import 'package:djcateringapps/repository/product_repository.dart';

import 'package:flutter/material.dart';

class DetailProductProvider extends ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();

  Future<Products> readProductUsingCategory(idCategory) async {
    Products products =
        await _productRepository.readProductUsingCategory(idCategory);

    return products;
  }
}
