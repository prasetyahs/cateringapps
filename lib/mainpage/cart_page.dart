import 'package:djcateringapps/model/cart/result.dart';
import 'package:djcateringapps/model/cart/users_cart.dart';

import 'package:djcateringapps/provider/cart_provider.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/widget/info_dialog.dart';
import 'package:djcateringapps/widget/loading_dialog.dart';
import 'package:djcateringapps/widget/row_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_indicators/progress_indicators.dart';
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
        body: Consumer<CartProvider>(builder: (context, value, child) {
          return FutureBuilder(
            future: value.users(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FutureBuilder<UsersCart>(
                  future: value.readCart(snapshot.data.idUsers),
                  builder: (context1, snapshot1) {
                    if (snapshot1.hasData) {
                      return NotificationListener<
                              OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: snapshot1.data.result.length > 0
                              ? Column(
                                  children: [
                                    Container(
                                      height: ScreenUtil().setHeight(470),
                                      child: ListView.builder(
                                          itemCount:
                                              snapshot1.data.result.length,
                                          itemBuilder:
                                              (BuildContext ctx, int index) {
                                            Result result =
                                                snapshot1.data.result[index];
                                            return RowCart(
                                                idCart: result.idCart,
                                                productName: result.productName,
                                                amount: result.purchaseamount,
                                                productImage:
                                                    BaseUrl.BASE_URL_IMAGE +
                                                        result.productImage,
                                                totalPrice: double.parse(
                                                        result.price) *
                                                    double.parse(
                                                        result.purchaseamount));
                                          }),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          bottom: 10,
                                          top: 15),
                                      child: Text(
                                        "Total",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red,
                                            fontSize: ScreenUtil().setSp(20)),
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: 15, right: 15),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 2,
                                              blurRadius: 10,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ]),
                                      padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                          top: 10,
                                          bottom: 10),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Subtotal",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14))),
                                              Consumer<CartProvider>(builder:
                                                  (context, value, child) {
                                                return FutureBuilder(
                                                    future: value.users(),
                                                    builder:
                                                        (context, snapshot) {
                                                      if (snapshot.hasData) {
                                                        value
                                                            .subTotalAll(
                                                                snapshot.data
                                                                    .idUsers)
                                                            .then((value1) => value
                                                                        .subTotal <=
                                                                    0
                                                                ? value.setSubTotal(
                                                                    value1
                                                                        .subtotal
                                                                        .toDouble())
                                                                : 0);

                                                        return value.subTotal >
                                                                0
                                                            ? Text(
                                                                new FlutterMoneyFormatter(
                                                                        amount: value
                                                                            .subTotal,
                                                                        settings: MoneyFormatterSettings(
                                                                            symbol:
                                                                                'IDR',
                                                                            thousandSeparator:
                                                                                '.',
                                                                            decimalSeparator:
                                                                                ',',
                                                                            symbolAndNumberSeparator:
                                                                                ' ',
                                                                            fractionDigits:
                                                                                2,
                                                                            compactFormatType:
                                                                                CompactFormatType.short))
                                                                    .output
                                                                    .symbolOnLeft,
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontSize: ScreenUtil()
                                                                        .setSp(
                                                                            14)),
                                                              )
                                                            : JumpingText(
                                                                '...',
                                                                style: TextStyle(
                                                                    fontSize: ScreenUtil()
                                                                        .setSp(
                                                                            14),
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              );
                                                      } else {
                                                        return Container();
                                                      }
                                                    });
                                              })
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Jumlah Jenis Produk",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(14))),
                                              Consumer<CartProvider>(
                                                builder:
                                                    (context, value, child) =>
                                                        FutureBuilder(
                                                            future:
                                                                value.users(),
                                                            builder: (context,
                                                                snapshot) {
                                                              if (snapshot
                                                                  .hasData) {
                                                                return FutureBuilder(
                                                                  future: value
                                                                      .totalProductCart(snapshot
                                                                          .data
                                                                          .idUsers),
                                                                  builder: (context1, snapshot1) => snapshot1
                                                                          .hasData
                                                                      ? Text(
                                                                          snapshot1
                                                                              .data
                                                                              .result
                                                                              .toString(),
                                                                          style: TextStyle(
                                                                              color: Colors.red,
                                                                              fontSize: ScreenUtil().setSp(14)))
                                                                      : JumpingText(
                                                                          '...',
                                                                          style: TextStyle(
                                                                              color: Colors.red,
                                                                              fontSize: ScreenUtil().setSp(14),
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                );
                                                              } else {
                                                                return Container();
                                                              }
                                                            }),
                                              )
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "TOTAL",
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(14)),
                                              ),
                                              Consumer<CartProvider>(
                                                builder: (context, value,
                                                        child) =>
                                                    value.subTotal > 0
                                                        ? Text(
                                                            new FlutterMoneyFormatter(
                                                                    amount: value
                                                                        .subTotal,
                                                                    settings: MoneyFormatterSettings(
                                                                        symbol:
                                                                            'IDR',
                                                                        thousandSeparator:
                                                                            '.',
                                                                        decimalSeparator:
                                                                            ',',
                                                                        symbolAndNumberSeparator:
                                                                            ' ',
                                                                        fractionDigits:
                                                                            2,
                                                                        compactFormatType:
                                                                            CompactFormatType.short))
                                                                .output
                                                                .symbolOnLeft,
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            14)),
                                                          )
                                                        : JumpingText(
                                                            '...',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color:
                                                                    Colors.red),
                                                          ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            left: 15, right: 15, top: 15),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Consumer<CartProvider>(
                                          builder: (context, value, child) =>
                                              RaisedButton(
                                            onPressed: () {
                                              UsersCart usersCart = value.cart;
                                              Navigator.pushNamed(
                                                  context, "/orderSettings",
                                                  arguments: usersCart);
                                            },
                                            child: Text(
                                              "LANJUT ORDER",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            color: Colors.red,
                                          ),
                                        ))
                                  ],
                                )
                              : Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.only(bottom: 50),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "images/not_found.png",
                                        width: ScreenUtil().setWidth(200),
                                        height: ScreenUtil().setHeight(200),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text(
                                            "KERAJANG ANDA MASIH KOSONG",
                                            style: TextStyle(
                                                fontSize:
                                                    ScreenUtil().setSp(20))),
                                      )
                                    ],
                                  )));
                    } else {
                      return Center(child:CircularProgressIndicator());
                    }
                  },
                );
              } else {
                return Container();
              }
            },
          );
        }));
  }
}
