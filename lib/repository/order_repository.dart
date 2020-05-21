import 'dart:io';

import 'package:djcateringapps/model/order/cart.dart';
import 'package:djcateringapps/model/order/num_rows_cart.dart';
import 'package:djcateringapps/model/order/sub_total.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class OrderRepository {
  Future<SubTotal> countSubTotal(idUsers, idProduct, amount) async {
    try {
      final response =
          await http.post(BaseUrl.BASE_URL + "product/countSubTotal", body: {
        'id_users': idUsers.toString(),
        'id_product': idProduct.toString(),
        'amount': amount.toString()
      });
      if (response.statusCode == 200) {
        return SubTotal.fromJson(convert.jsonDecode(response.body));
      } else {
        throw SocketException('Failed to load');
      }
    } catch (err) {
      throw SocketException(err);
    }
  }

  Future<Cart> addCart(idUsers, idProduct, purchaseAmount) async {
    try {
      final response =
          await http.post(BaseUrl.BASE_URL + 'cart/addcart', body: {
        'id_users': idUsers.toString(),
        'id_product': idProduct.toString(),
        'purchase_amount': purchaseAmount.toString()
      });
      if (response.statusCode == 200) {
        return Cart.fromJson(convert.jsonDecode(response.body));
      } else {
        throw SocketException('Failed to load');
      }
    } catch (err) {
      throw SocketException(err.toString());
    }
  }

  Future<NumRowsCart> numRowsCart(idUsers) async {
    try {
      final response = await http.post(BaseUrl.BASE_URL + "cart/getnumrowcart",
          body: {'id_users': idUsers.toString()});
      if (response.statusCode == 200) {
        return NumRowsCart.fromJson(convert.jsonDecode(response.body));
      } else {
        throw SocketException('Failed to load');
      }
    } catch (err) {
      throw SocketException(err);
    }
  }
}
