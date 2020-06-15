import 'package:djcateringapps/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'loading_dialog.dart';

class RowCart extends StatelessWidget {
  final String productName, productImage, idCart;
  final String amount;
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
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 10),
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
                        size: 16,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                  child: LoadingDialog(),
                                  elevation: 10.0,
                                ));
                        value.users().then((val) => value
                                .deleteCart(idCart, val.idUsers)
                                .then((value1) {
                              if (value1.result != null) {
                                Navigator.pop(context);
                                if (value1.countRow <= 0) {
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, '/homePage', (route) => false);
                                }
                                value.setSubTotal(0);
                              } else {
                                Navigator.pop(context);
                              }
                            }));
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
                Container(
                  padding: EdgeInsets.all(4),
                  child:
                      Consumer<CartProvider>(builder: (context, value, child) {
                    return Row(
                      children: [
                        Container(
                            width: ScreenUtil().setWidth(40),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFe0f2f1)),
                            child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  value.amountIncrement(amount);
                                  value.editAmountcart(
                                      idCart, value.amount.toString());
                                  value.setSubTotal(0);
                                },
                                child: Text(
                                  '+',
                                  textAlign: TextAlign.center,
                                ))),
                        Container(
                            width: ScreenUtil().setWidth(40),
                            child: Text(
                              amount,
                              textAlign: TextAlign.center,
                            )),
                        Container(
                            width: ScreenUtil().setWidth(40),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFe0f2f1)),
                            child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Colors.red,
                                onPressed: () {
                                  value.amountDecrement(amount);
                                  value.editAmountcart(
                                      idCart, value.amount.toString());
                                  value.setSubTotal(0);
                                },
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                ))),
                      ],
                    );
                  }),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
