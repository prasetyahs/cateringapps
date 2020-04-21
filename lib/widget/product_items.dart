import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductItems extends StatelessWidget {
  final String productName, productDesc, productImage, price;

  const ProductItems({
    this.productName,
    this.productDesc,
    this.productImage,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.network(productImage,height: 120,fit: BoxFit.cover,),
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
            onPressed: () {},
            child: Text(
              'ADD TO CART',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            color: Colors.redAccent,
          )
        ],
      ),
    );
  }
}
