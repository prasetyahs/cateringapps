import 'dart:io';

import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/model/order/MultipleResponseOrder.dart';
import 'package:djcateringapps/model/order/cart.dart';
import 'package:djcateringapps/model/order/model_detail_order.dart';

import 'package:djcateringapps/model/order/num_rows_cart.dart';
import 'package:djcateringapps/model/order/order.dart';
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

  Future<NumRowsCart> numRowsCart(String idUsers) async {
    final response = await http.post(BaseUrl.BASE_URL + "cart/getnumrowcart",
        body: {'id_users': idUsers.toString()});
    if (response.statusCode == 200) {
      return NumRowsCart.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<UsersCart> readCart(String idUsers) async {
    final response =
        await http.get(BaseUrl.BASE_URL + "cart/readCart?id_users=" + idUsers);

    if (response.statusCode == 200) {
      return UsersCart.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<Cart> deleteCart(String idCart, String idUsers) async {
    final response = await http.get(BaseUrl.BASE_URL +
        "cart/deletecart?id_cart=" +
        idCart +
        "&id_users=" +
        idUsers);

    if (response.statusCode == 200) {
      return Cart.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<Cart> editAmountCart(String idCart, String amount) async {
    final response = await http.get(BaseUrl.BASE_URL +
        "cart/editCart?id_cart=" +
        idCart +
        "&amount=" +
        amount);

    if (response.statusCode == 200) {
      return Cart.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<SubTotal> subTotalAll(String idUsers) async {
    final response =
        await http.get(BaseUrl.BASE_URL + "cart/subtotal?id_users=" + idUsers);
    if (response.statusCode == 200) {
      return SubTotal.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<NumRowsCart> totalProductCart(String idUsers) async {
    final response = await http
        .get(BaseUrl.BASE_URL + "cart/totalProductCart?id_users=" + idUsers);

    if (response.statusCode == 200) {
      return NumRowsCart.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<Order> addOrder(String idUsers, String idCart, String totalOrder,
      String dateRequest) async {
    final response =
        await http.post(BaseUrl.BASE_URL + "order/ordering", body: {
      'id_users': idUsers,
      'id_cart': idCart,
      'total': totalOrder,
      'date_request': dateRequest
    });
    if (response.statusCode == 200) {
      return Order.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<MultipleResponseOrder> readOrderByUser(String idUsers) async {
    final response = await http
        .get(BaseUrl.BASE_URL + "order/showOrderByUsers?id_users=" + idUsers);

    if (response.statusCode == 200) {
      return MultipleResponseOrder.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }

  Future<ModelDetailOrder> readDetailOrder(
      String idUsers, String numberOrder) async {
    final response = await http.get(BaseUrl.BASE_URL +
        "order/readDetailOrder?id_users=" +
        idUsers +
        "&number_order=" +
        numberOrder);
    if (response.statusCode == 200) {
      return ModelDetailOrder.fromJson(convert.jsonDecode(response.body));
    } else {
      throw SocketException('Failed to load');
    }
  }
}
