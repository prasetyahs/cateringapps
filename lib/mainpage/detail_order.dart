import 'package:djcateringapps/model/order/model_detail_order.dart';
import 'package:djcateringapps/model/order/order_by_user.dart';
import 'package:djcateringapps/provider/detail_order_provider.dart';
import 'package:djcateringapps/widget/dialog_upload_image.dart';
import 'package:djcateringapps/widget/row_detail_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

class DetailOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailOrderState();
  }
}

class DetailOrderState extends State<DetailOrder> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;
    Orderbyuser orderbyuser;
    if (args != null) {
      orderbyuser = args['orderDetail'];
    }
    return Scaffold(
      appBar: AppBar(title: Text('Detail Order')),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        height: ScreenUtil().setHeight(140),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Total yang harus dibayar',
              style: TextStyle(fontSize: ScreenUtil().setSp(13)),
            ),
            Text(
                new FlutterMoneyFormatter(
                        amount: double.parse(orderbyuser.totalOrder),
                        settings: MoneyFormatterSettings(
                            symbol: 'IDR',
                            thousandSeparator: '.',
                            decimalSeparator: ',',
                            symbolAndNumberSeparator: ' ',
                            fractionDigits: 2,
                            compactFormatType: CompactFormatType.short))
                    .output
                    .symbolOnLeft,
                style: TextStyle(fontSize: ScreenUtil().setSp(13)))
          ]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('DP yang harus dibayar',
                  style: TextStyle(fontSize: ScreenUtil().setSp(13))),
              Text(
                  new FlutterMoneyFormatter(
                          amount: double.parse(orderbyuser.totalOrder) * 0.3,
                          settings: MoneyFormatterSettings(
                              symbol: 'IDR',
                              thousandSeparator: '.',
                              decimalSeparator: ',',
                              symbolAndNumberSeparator: ' ',
                              fractionDigits: 2,
                              compactFormatType: CompactFormatType.short))
                      .output
                      .symbolOnLeft,
                  style: TextStyle(fontSize: ScreenUtil().setSp(13)))
            ],
          ),
          SizedBox(height: 10),
          Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                onPressed: () {
                  if (orderbyuser.status == "Diterima" ||
                      orderbyuser.status == "Selesai") {
                    return Fluttertoast.showToast(
                        msg:
                            "Order Kamu Masih Belum DiKonfirmasi atau Sudah Selesai",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  } else {
                    return showDialog(
                        context: context,
                        child: ChangeNotifierProvider.value(
                            value: DetailOrderProvider(),
                            child: Dialog(
                                child: DialogUploadImage(
                              idOrder: orderbyuser.orderNumber,
                            ))));
                  }
                },
                child: Text('Upload Bukti DP/Lunas',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13), color: Colors.white)),
                color: Colors.red,
              )),
        ]),
      )),
      backgroundColor: Color.fromRGBO(240, 240, 240, 257),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (overscroll) {
          overscroll.disallowGlow();
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Orderan Saya'),
                        Text(
                          orderbyuser.dateOrder,
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    SizedBox(height: 10),
                    Divider(
                      color: Color.fromRGBO(240, 240, 240, 257),
                      height: 1,
                      thickness: 2,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('No Order '),
                        Text(
                          orderbyuser.orderNumber,
                          style: TextStyle(color: Colors.red),
                        )
                      ],
                    ),
                    Consumer<DetailOrderProvider>(
                      builder: (context, value, child) =>
                          FutureBuilder<ModelDetailOrder>(
                        future: value.readDetailOrder(
                            orderbyuser.idUsers, orderbyuser.orderNumber),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return NotificationListener<
                                OverscrollIndicatorNotification>(
                              onNotification: (overscroll) {
                                overscroll.disallowGlow();
                                return true;
                              },
                              child: LimitedBox(
                                maxHeight: 280.0,
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data.myOrder.length,
                                    itemBuilder: (context, index) => Column(
                                          children: [
                                            RowDetailOrder(
                                              productName: snapshot.data
                                                  .myOrder[index].productName,
                                              price: snapshot
                                                  .data.myOrder[index].price,
                                              amountProduct: snapshot
                                                  .data
                                                  .myOrder[index]
                                                  .purchaseamount,
                                              imageProduct: snapshot.data
                                                  .myOrder[index].productImage,
                                            ),
                                            SizedBox(height: 10),
                                            Divider(
                                              color: Color.fromRGBO(
                                                  240, 240, 240, 257),
                                              height: 1,
                                              thickness: 2,
                                            ),
                                          ],
                                        )),
                              ),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Status :',
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          child: Text(
                            orderbyuser.status,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(13)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.white,
                child: Column(children: [
                  Row(
                    children: [
                      Text('Keterangan'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Untuk melakukan pembayaran bisa melalui rekening : 32839283902890 '),
                ]),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
