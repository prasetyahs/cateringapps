import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/screenutil.dart';

class MyOderRow extends StatelessWidget {
  final String productName, productImage, idCart;
  final String amount;
  final double totalPrice;

  const MyOderRow(
      {Key key,
      this.productName,
      this.productImage,
      this.amount,
      this.idCart,
      this.totalPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(105),
      color: Colors.white,
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 10),
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Container(
                  width: ScreenUtil().setWidth(70),
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(productImage, scale: 1.0))),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(140),
                  child: ListTile(
                    title: Text(productName,
                        style: TextStyle(fontSize: ScreenUtil().setSp(15))),
                    subtitle: Text(
                      new FlutterMoneyFormatter(
                              amount: totalPrice,
                              settings: MoneyFormatterSettings(
                                  symbol: 'IDR',
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                  symbolAndNumberSeparator: ' ',
                                  fractionDigits: 2,
                                  compactFormatType: CompactFormatType.short))
                          .output
                          .symbolOnLeft,
                      style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                    ),
                  ),
                )
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
