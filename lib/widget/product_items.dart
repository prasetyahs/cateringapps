import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItems extends StatelessWidget {
  final String productName, productDesc, productImage, price, idProduct;
  final double margin;

  const ProductItems(
      {this.productName,
      this.productDesc,
      this.productImage,
      this.price,
      this.idProduct,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(150),
      margin: EdgeInsets.symmetric(horizontal: margin),
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
          Divider(
            height: 1,
            thickness: 1.0,
          ),
          SizedBox(height: 10),
          Text(
            new FlutterMoneyFormatter(
                              amount: double.parse(price),
                              settings: MoneyFormatterSettings(
                                  symbol: 'IDR',
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                  symbolAndNumberSeparator: ' ',
                                  fractionDigits: 2,
                                  compactFormatType: CompactFormatType.short))
                          .output
                          .symbolOnLeft,
            style: TextStyle(
                color: Colors.red.withOpacity(0.8),
                fontSize: ScreenUtil().setSp(15)),
          ),
        ],
      ),
    );
  }
}
