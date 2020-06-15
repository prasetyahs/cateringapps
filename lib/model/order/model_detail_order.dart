import 'package:djcateringapps/model/order/my_order.dart';

class ModelDetailOrder {
  List<MyOrder> myOrder;
  int status;

  ModelDetailOrder({this.myOrder, this.status});

  ModelDetailOrder.fromJson(Map<String, dynamic> json) {
    if (json['my_order'] != null) {
      myOrder = new List<MyOrder>();
      json['my_order'].forEach((v) {
        myOrder.add(new MyOrder.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.myOrder != null) {
      data['my_order'] = this.myOrder.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}