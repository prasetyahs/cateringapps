import 'package:djcateringapps/model/order/order_by_user.dart';

class MultipleResponseOrder {
  List<Orderbyuser> orderbyuser;
  int status;

  MultipleResponseOrder({this.orderbyuser, this.status});

  MultipleResponseOrder.fromJson(Map<String, dynamic> json) {
    if (json['orderbyuser'] != null) {
      orderbyuser = new List<Orderbyuser>();
      json['orderbyuser'].forEach((v) {
        orderbyuser.add(new Orderbyuser.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderbyuser != null) {
      data['orderbyuser'] = this.orderbyuser.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}