import 'package:djcateringapps/model/order/MultipleResponseOrder.dart';
import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/widget/list_order_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<IndexProvider>(
        builder: (context, value, child) => FutureBuilder(
            future: value.users(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FutureBuilder<MultipleResponseOrder>(
                  future: value.readOrderByUsers(snapshot.data.idUsers),
                  builder: (context, snapshot1) {
                    if (snapshot1.hasData) {
                      MultipleResponseOrder multipleResponseOrder =
                          snapshot1.data;
                      return snapshot1.data.orderbyuser.length > 0
                          ? NotificationListener<
                                  OverscrollIndicatorNotification>(
                              onNotification: (overscroll) {
                                overscroll.disallowGlow();
                                return true;
                              },
                              child: Container(
                                child: ListView.builder(
                                    itemCount: multipleResponseOrder
                                        .orderbyuser.length,
                                    itemBuilder: (BuildContext ctx, int index) {
                                      return InkWell(
                                        onTap: () => Navigator.pushNamed(
                                            context, "/detailOrder",
                                            arguments: {
                                              "orderDetail":
                                                  multipleResponseOrder
                                                      .orderbyuser[index]
                                            }),
                                        child: ListOrderItems(
                                          productImage: multipleResponseOrder
                                              .orderbyuser[index].productImage,
                                          orderNumber: multipleResponseOrder
                                              .orderbyuser[index].orderNumber,
                                          productName: multipleResponseOrder
                                              .orderbyuser[index].productName,
                                          orderDate: multipleResponseOrder
                                              .orderbyuser[index].dateOrder,
                                          status: multipleResponseOrder
                                              .orderbyuser[index].status,
                                          totalOrder: multipleResponseOrder
                                              .orderbyuser[index].totalOrder,
                                        ),
                                      );
                                    }),
                              ))
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
                                    child: Text("ANDA BELUM MELAKUKAN ORDER",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(20))),
                                  )
                                ],
                              ));
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                );
              } else {
                return Container();
              }
            }));
  }
}
