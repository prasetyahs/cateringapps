import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/widget/add_cart_dialog_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItems extends StatelessWidget {
  final String productName, productDesc, productImage, price, idProduct;
  final double margin;

  const ProductItems({
    this.productName,
    this.productDesc,
    this.productImage,
    this.price,
    this.idProduct,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.symmetric(horizontal:margin),
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.network(
            productImage,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            productName,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            price,
            style: TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 11),
          ),
          SizedBox(height: 10),
          FlatButton(
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(color: Colors.red)),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => Dialog(
                      elevation: 10.0,
                      child: ChangeNotifierProvider.value(
                        value: IndexProvider(),
                        child: AddCartDialogContent(
                            productName: productName,
                            productPrice: price,
                            idProduct: idProduct,
                            imageContent: productImage),
                      ),
                    )),
            child: Text(
              'TAMBAH CART',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
