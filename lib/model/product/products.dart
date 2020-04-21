import 'package:djcateringapps/model/product/product.dart';

class Products {
  List<Product> product;
  int row;

  Products({this.product, this.row});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = new List<Product>();
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
    row = json['row'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    data['row'] = this.row;
    return data;
  }
}