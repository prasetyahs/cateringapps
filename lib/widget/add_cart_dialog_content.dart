import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class AddCartDialogContent extends StatelessWidget {
  final String imageContent, productName, productPrice, idProduct;

  const AddCartDialogContent(
      {Key key,
      this.imageContent,
      this.productName,
      this.productPrice,
      this.idProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(290),
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Jumlah Yang Ingin Di Beli',
                  style: TextStyle(fontSize: ScreenUtil().setHeight(15)),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.close,
                      size: ScreenUtil().setWidth(20),
                    ),
                  ),
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
            Divider(
              thickness: 1.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  imageContent,
                  width: ScreenUtil().setHeight(100),
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(productName),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Container(
                            width: ScreenUtil().setWidth(40),
                            height: ScreenUtil().setHeight(40),
                            child: Consumer<IndexProvider>(
                              builder: (context, value, child) => RaisedButton(
                                color: Colors.redAccent,
                                child: Text(
                                  '+',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(17),
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  value.users().then((users) {
                                    value.incrementPurchase();
                                    value.setSubTotal(users.idUsers, idProduct,
                                        value.purchaseAmount);
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              ),
                            )),
                        SizedBox(width: 20),
                        Consumer<IndexProvider>(
                          builder: (context, value, child) =>
                              Text('${value.purchaseAmount}',
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(17),
                                  )),
                        ),
                        SizedBox(width: 20),
                        Container(
                            width: ScreenUtil().setWidth(40),
                            height: ScreenUtil().setHeight(40),
                            child: Consumer<IndexProvider>(
                              builder: (context, value, child) => RaisedButton(
                                color: Colors.redAccent,
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(17),
                                      color: Colors.white),
                                ),
                                onPressed: () {
                                  value.users().then((users) {
                                    value.decrementPurchase();
                                    value.setSubTotal(users.idUsers, idProduct,
                                        value.purchaseAmount);
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              ),
                            )),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Text(
                new FlutterMoneyFormatter(
                        amount: double.parse(productPrice),
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
                  color: Colors.redAccent,
                  fontSize: ScreenUtil().setSp(13),
                )),
            SizedBox(height: 10),
            Divider(thickness: 1.0),
            Text(
              'SUBTOTAL',
              style: TextStyle(
                  fontSize: ScreenUtil().setHeight(11),
                  color: Colors.grey.withOpacity(0.8)),
            ),
            Consumer<IndexProvider>(builder: (context, value, child) {
              return value.subTotal.subtotal == 0 && value.purchaseAmount > 0
                  ? JumpingText(
                      '...',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  : Text(new FlutterMoneyFormatter(
                          amount: value.subTotal.subtotal.toDouble(),
                          settings: MoneyFormatterSettings(
                              symbol: 'IDR',
                              thousandSeparator: '.',
                              decimalSeparator: ',',
                              symbolAndNumberSeparator: ' ',
                              fractionDigits: 2,
                              compactFormatType: CompactFormatType.short))
                      .output
                      .symbolOnLeft);
            }),
            Container(
                width: MediaQuery.of(context).size.width,
                child: Consumer<IndexProvider>(
                    builder: (context, value, child) => FlatButton(
                          color: Colors.red,
                          child: Text(
                            'TAMBAH KERANJANG',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            if (value.purchaseAmount > 0) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                        child: LoadingDialog(),
                                        elevation: 10.0,
                                      ));
                              value.users().then((users) {
                                value
                                    .addCart(users.idUsers, idProduct,
                                        value.purchaseAmount)
                                    .then((val) => Navigator.pop(context));
                              });
                            }
                          },
                        )))
          ]),
    );
  }
}
