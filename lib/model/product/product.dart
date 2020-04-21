class Product {
  String idProduct;
  String idCategory;
  String productName;
  String productDescription;
  String productImage;
  String price;
  String del;
  String categoryName;

  Product(
      {this.idProduct,
      this.idCategory,
      this.productName,
      this.productDescription,
      this.productImage,
      this.price,
      this.del,
      this.categoryName});

  Product.fromJson(Map<String, dynamic> json) {
    idProduct = json['id_product'];
    idCategory = json['id_category'];
    productName = json['product_name'];
    productDescription = json['product_description'];
    productImage = json['product_image'];
    price = json['price'];
    del = json['del'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_product'] = this.idProduct;
    data['id_category'] = this.idCategory;
    data['product_name'] = this.productName;
    data['product_description'] = this.productDescription;
    data['product_image'] = this.productImage;
    data['price'] = this.price;
    data['del'] = this.del;
    data['category_name'] = this.categoryName;
    return data;
  }
}