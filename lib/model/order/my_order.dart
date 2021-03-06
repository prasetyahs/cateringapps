class MyOrder {
  String idOrder;
  String idCart;
  String orderNumber;
  String totalOrder;
  String dateOrder;
  String status;
  String del;
  String idProduct;
  String idUsers;
  String purchaseamount;
  String isOrder;
  String idCategory;
  String productName;
  String productDescription;
  String productImage;
  String price;

  MyOrder(
      {this.idOrder,
      this.idCart,
      this.orderNumber,
      this.totalOrder,
      this.dateOrder,
      this.status,
      this.del,
      this.idProduct,
      this.idUsers,
      this.purchaseamount,
      this.isOrder,
      this.idCategory,
      this.productName,
      this.productDescription,
      this.productImage,
      this.price});

  MyOrder.fromJson(Map<String, dynamic> json) {
    idOrder = json['id_order'];
    idCart = json['id_cart'];
    orderNumber = json['order_number'];
    totalOrder = json['total_order'];
    dateOrder = json['date_order'];
    status = json['status'];
    del = json['del'];
    idProduct = json['id_product'];
    idUsers = json['id_users'];
    purchaseamount = json['purchaseamount'];
    isOrder = json['is_order'];
    idCategory = json['id_category'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_order'] = this.idOrder;
    data['id_cart'] = this.idCart;
    data['order_number'] = this.orderNumber;
    data['total_order'] = this.totalOrder;
    data['date_order'] = this.dateOrder;
    data['status'] = this.status;
    data['del'] = this.del;
    data['id_product'] = this.idProduct;
    data['id_users'] = this.idUsers;
    data['purchaseamount'] = this.purchaseamount;
    data['is_order'] = this.isOrder;
    data['id_category'] = this.idCategory;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_image'] = this.productImage;
    data['price'] = this.price;
    return data;
  }
}