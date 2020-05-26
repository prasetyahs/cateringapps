import 'package:djcateringapps/model/product/products.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductRepository {
  Future<Products> readAllProduct() async {
    final response = await http.get(BaseUrl.BASE_URL + 'product');
    if (response.statusCode == 200) {
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load');
    }
  }
}
