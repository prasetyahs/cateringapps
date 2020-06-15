class Cart {
  bool result;
  int countRow;
  int idCart;

  Cart({this.result, this.countRow});

  Cart.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    countRow = json['row'];
    idCart = json['id_cart'] != null ? json['id_cart'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    data['row'] = this.countRow;
    data['id_cart'] = this.idCart;
    return data;
  }
}
