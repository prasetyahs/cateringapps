import 'package:djcateringapps/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'loading_dialog.dart';

class RowCart extends StatelessWidget {
  final String productName, productImage, idCart;
  final amount;
  final double totalPrice;

  const RowCart(
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
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 2, left: 5, right: 5),
                  width: ScreenUtil().setWidth(15),
                  height: ScreenUtil().setHeight(15),
                  child: Consumer<CartProvider>(
                    builder: (context, value, child) => IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.close,
                        size: 15,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                  child: LoadingDialog(),
                                  elevation: 10.0,
                                ));

                        value.deleteCart(idCart).then((value) => value.result
                            ? Navigator.pop(context)
                            : Navigator.pop(context));
                      },
                    ),
                  )),
            ],
          ),
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
                    title: Text('Crosaint',
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
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(50),
                  height: ScreenUtil().setHeight(50),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "-",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.redAccent),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(4),
                  child: Text(amount.toString()),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                      border: Border.all(color: Colors.redAccent)),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(50),
                  height: ScreenUtil().setHeight(50),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "+",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          color: Colors.redAccent),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
