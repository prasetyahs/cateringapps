import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowCart extends StatelessWidget {
  final String productName, productImage;
  final amount;
  final double totalPrice;

  const RowCart({Key key, this.productName, this.productImage, this.amount, this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(100),
      color: Colors.white,
      margin: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            height: ScreenUtil().setHeight(10),
            child: InkWell(
              onTap: () {},
              child: Icon(
                Icons.close,
                size: ScreenUtil().setHeight(15),
              ),
            ),
            alignment: Alignment.topRight,
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
