import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOrderItems extends StatelessWidget {
  final ResponsiveLayout responsiveLayout;
  final String orderNumber,
      productName,
      orderDate,
      totalOrder,
      status,
      productImage;
  const ListOrderItems(
      {Key key,
      this.responsiveLayout,
      this.orderNumber,
      this.productName,
      this.orderDate,
      this.totalOrder,
      this.productImage,
      this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5, right: 15, left: 15,bottom: 5),
      padding: EdgeInsets.all(15),
      height: ScreenUtil().setHeight(160),
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Order No : '),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    orderNumber,
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              height: 2.0,
              thickness: 1.0,
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  BaseUrl.BASE_URL_IMAGE + productImage,
                  width: ScreenUtil().setWidth(70),
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(productName,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        )),
                    Text(
                      new FlutterMoneyFormatter(
                              amount: double.parse(totalOrder),
                              settings: MoneyFormatterSettings(
                                  symbol: 'IDR',
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                  symbolAndNumberSeparator: ' ',
                                  fractionDigits: 2,
                                  compactFormatType: CompactFormatType.short))
                          .output
                          .symbolOnLeft,
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(19)),
                    Text(
                      orderDate,
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: ScreenUtil().setSp(13)),
                    )
                  ],
                ),
                Container(
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.8)),
                )
              ],
            ),
          ]),
    );
  }
}
