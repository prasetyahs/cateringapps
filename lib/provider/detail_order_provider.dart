import 'package:djcateringapps/model/order/model_detail_order.dart';
import 'package:djcateringapps/repository/order_repository.dart';
import 'package:flutter/foundation.dart';

class DetailOrderProvider with ChangeNotifier {
  OrderRepository _orderRepository = OrderRepository();
  int i = 0;
  Future<ModelDetailOrder> readDetailOrder(
      String idUsers, String numberOrder) async {
    ModelDetailOrder detailOrder =
        await _orderRepository.readDetailOrder(idUsers, numberOrder);
    notifyListeners();
    return detailOrder;
  }
}
