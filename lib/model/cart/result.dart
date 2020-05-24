class Result {
  String idUsers;
  String idProduct;
  String productName;
  String price;
  String productImage;
  String isOrder;
  String purchaseamount;
  String idCart;
  Result(
      {this.idUsers,
      this.idProduct,
      this.productName,
      this.price,
      this.productImage,
      this.isOrder,
      this.idCart,
      this.purchaseamount});

  Result.fromJson(Map<String, dynamic> json) {
    idUsers = json['id_users'];
    idProduct = json['id_product'];
    productName = json['product_name'];
    price = json['price'];
    productImage = json['product_image'];
    isOrder = json['is_order'];
    idCart = json['id_cart'];
    purchaseamount = json['purchaseamount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_users'] = this.idUsers;
    data['id_product'] = this.idProduct;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['id_cart'] = this.idCart;
    data['product_image'] = this.productImage;
    data['is_order'] = this.isOrder;
    data['purchaseamount'] = this.purchaseamount;
    return data;
  }
}