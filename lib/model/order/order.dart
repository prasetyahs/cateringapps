class Order {
  bool order;
  String message;

  Order({this.order, this.message});

  Order.fromJson(Map<String, dynamic> json) {
    order = json['order'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order'] = this.order;
    data['message'] = this.message;
    return data;
  }
}