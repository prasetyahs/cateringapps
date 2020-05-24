import 'package:djcateringapps/model/cart/result.dart';
import 'package:djcateringapps/model/cart/users_cart.dart';
import 'package:djcateringapps/provider/cart_provider.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/widget/row_cart.dart';
import 'package:flutter/material.dart';
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
              height: ScreenUtil().setHeight(500),
              child: Consumer<CartProvider>(builder: (context, value, child) {
                return FutureBuilder(
                  future: value.users(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder<UsersCart>(
                          future: value.readCart(snapshot.data.idUsers.toString()),
                          builder: (BuildContext context,
                              AsyncSnapshot<UsersCart> snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data.result.length,
                                  itemBuilder: (BuildContext ctx, int index) {
                                    Result result = snapshot.data.result[index];
                                    return RowCart(
                                        idCart: result.idCart,
                                        productName: result.productName,
                                        amount: result.purchaseamount,
                                        productImage: BaseUrl.BASE_URL_IMAGE +
                                            result.productImage,
                                        totalPrice: double.parse(result.price) *
                                            double.parse(
                                                result.purchaseamount));
                                  });
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          });
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                );
              }))
        ],
      ),
    );
  }
}
