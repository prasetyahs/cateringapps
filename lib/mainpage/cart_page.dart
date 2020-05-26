import 'package:djcateringapps/model/cart/result.dart';
import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/provider/cart_provider.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/widget/row_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<CartPage> {
  String userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 257),
      appBar: AppBar(
          centerTitle: true,
          title: Text('KERANJANG ANDA',
              style: TextStyle(fontSize: ScreenUtil().setSp(17)))),
      body: Column(
        children: [
          Container(
              height: ScreenUtil().setHeight(480),
              child: Consumer<CartProvider>(builder: (context, value, child) {
                return FutureBuilder(
                  future: value.users(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder<UsersCart>(
                          future:
                              value.readCart(snapshot.data.idUsers.toString()),
                          builder: (BuildContext context,
                              AsyncSnapshot<UsersCart> snapshot) {
                            if (snapshot.hasData) {
                              return NotificationListener<
                                  OverscrollIndicatorNotification>(
                                onNotification: (overscroll) {
                                  overscroll.disallowGlow();
                                },
                                child: ListView.builder(
                                    itemCount: snapshot.data.result.length,
                                    itemBuilder: (BuildContext ctx, int index) {
                                      Result result =
                                          snapshot.data.result[index];
                                      return RowCart(
                                          idCart: result.idCart,
                                          productName: result.productName,
                                          amount: result.purchaseamount,
                                          productImage: BaseUrl.BASE_URL_IMAGE +
                                              result.productImage,
                                          totalPrice:
                                              double.parse(result.price) *
                                                  double.parse(
                                                      result.purchaseamount));
                                    }),
                              );
                         
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                );
              })),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 15),
            child: Text(
              "Total",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: ScreenUtil().setSp(20)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
            padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal",
                        style: TextStyle(fontSize: ScreenUtil().setSp(14))),
                    Text(
                      new FlutterMoneyFormatter(
                              amount: 100000,
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
                          color: Colors.red, fontSize: ScreenUtil().setSp(14)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jumlah Jenis Produk",
                        style: TextStyle(fontSize: ScreenUtil().setSp(14))),
                    Text("3",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenUtil().setSp(14))),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "TOTAL",
                      style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                    ),
                    Text(
                      new FlutterMoneyFormatter(
                              amount: 100000,
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
                          color: Colors.red, fontSize: ScreenUtil().setSp(14)),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {},
                child: Text(
                  "LANJUT ORDER",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
