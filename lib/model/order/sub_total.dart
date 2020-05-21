class SubTotal {
  int subtotal;
  String message;

  SubTotal({this.subtotal, this.message});

  SubTotal.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'] != null ? json['subtotal'] : null;
    message = json['message'] != null ? json['subtotal'] : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['message'] = this.message;
    return data;
  }
}
