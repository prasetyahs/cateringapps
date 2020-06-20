import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/widget/info_dialog.dart';
import 'package:djcateringapps/widget/loading_dialog.dart';
import 'package:djcateringapps/widget/my_oder_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_money_formatter/flutter_money_formatter.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class OrderSettings extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderSettingsState();
  }
}

class OrderSettingsState extends State<OrderSettings> {
  var controllerDateText = TextEditingController();

  List<Widget> orderItems = [];
  double subTotal = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controllerDateText.text = "0000-00-00";
    final UsersCart usersCart = ModalRoute.of(context).settings.arguments;
    usersCart.result.forEach((val) {
      orderItems.add(MyOderRow(
        productName: val.productName,
        productImage: BaseUrl.BASE_URL_IMAGE + val.productImage,
        idCart: val.idCart,
        amount: val.purchaseamount,
        totalPrice: double.parse(val.price) * double.parse(val.purchaseamount),
      ));
      subTotal += double.parse(val.price) * double.parse(val.purchaseamount);
    });

    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 257),
      appBar: AppBar(
        title: Text('Atur Order'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => showDialog(
                context: context,
                child: AlertDialog(
                  actions: [
                    FlatButton(
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                            context, "/homePage", (route) => false),
                        child: Text(
                          'Batalkan',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                    FlatButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Lanjut',
                      ),
                    )
                  ],
                  title: Column(
                    children: [
                      Text(
                        "Apakah Kamu Yakin ?",
                        style: TextStyle(fontSize: ScreenUtil().setSp(20)),
                      ),
                      Divider(
                        thickness: 1.0,
                      )
                    ],
                  ),
                  content: Text(
                    'Jika kamu keluar dari proses transaksi,transaksi kamu akan dibatalkan',
                    textAlign: TextAlign.start,
                  ),
                ))),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
              padding: EdgeInsets.all(20),
              height: ScreenUtil().setHeight(120),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Pembayaran'),
                      Text(new FlutterMoneyFormatter(
                              amount: subTotal,
                              settings: MoneyFormatterSettings(
                                  symbol: 'IDR',
                                  thousandSeparator: '.',
                                  decimalSeparator: ',',
                                  symbolAndNumberSeparator: ' ',
                                  fractionDigits: 2,
                                  compactFormatType: CompactFormatType.short))
                          .output
                          .symbolOnLeft)
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 40,
                          child: Consumer<IndexProvider>(
                            builder: (context, value, child) {
                              return FlatButton(
                                  color: Colors.red,
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        child: Dialog(
                                          child: LoadingDialog(),
                                        ));
                                    value.users().then((users) {
                                      usersCart.result.forEach((cartVal) {
                                        if (cartVal.idCart != "") {
                                          value.addOrder(
                                              users.idUsers,
                                              cartVal.idCart,
                                              subTotal.toString(),
                                              controllerDateText.text);
                                        } else {
                                          value
                                              .addCart(
                                                  users.idUsers,
                                                  cartVal.idProduct,
                                                  cartVal.purchaseamount)
                                              .then((val) {
                                            value.addOrder(
                                              users.idUsers,
                                              val.idCart.toString(),
                                              subTotal.toString(),
                                              controllerDateText.text);
                                          });
                                        }
                                      });
                                    }).whenComplete(() {
                                      Navigator.pop(context);
                                      showDialog(
                                        barrierDismissible: false,
                                          context: context,
                                          child: Dialog(
                                            child: DialogInfo(),
                                          ));
                                    });
                                  },
                                  child: Text(
                                    'Beli Sekarang',
                                    style: TextStyle(color: Colors.white),
                                  ));
                            },
                          ))
                    ],
                  )
                ],
              ))),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            'Alamat Pengiriman',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        'RT.2/RW.7, Cipinang Muara, Kota Jakarta Timur, Daerah Khusus Ibukota Jakarta.',
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(children: [
                    Row(
                      children: [
                        Text('Permintaan Tanggal Kirim',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                            height: ScreenUtil().setHeight(30),
                            width: MediaQuery.of(context).size.width - 40,
                            child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                  suffix: Icon(
                                Icons.date_range,
                                size: 18.0,
                              )),
                              controller: controllerDateText,
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2222))
                                  .then((value) => controllerDateText.text =
                                      "${value.year}-${value.month}-${value.day}"),
                            ))
                      ],
                    ),
                    SizedBox(height: 5),
                  ]),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.white,
                  child: Column(children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('Daftar Belanja',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(18),
                                  fontWeight: FontWeight.w800)),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1.0,
                      ),
                    ),
                    Column(
                      children: orderItems,
                    )
                  ]),
                )
              ],
            )),
      ),
    );
  }
}
