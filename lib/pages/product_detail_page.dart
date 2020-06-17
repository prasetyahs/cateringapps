import 'package:badges/badges.dart';
import 'package:djcateringapps/widget/product_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 240, 257),
        bottomNavigationBar: BottomAppBar(
            elevation: 10.0,
            child: Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.add_shopping_cart),
                            onPressed: () {}),
                        Container(
                          width: ScreenUtil().setWidth(330),
                          child: FlatButton(
                            color: Colors.red,
                            onPressed: () {},
                            child: Text(
                              'Beli',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )
                  ]),
              height: ScreenUtil().setHeight(60),
            )),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerbox) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: SliverAppBar(
                      title: Text('Crossaint'),
                      centerTitle: true,
                      actions: [
                        Container(
                          margin: EdgeInsets.only(right: 18),
                          child: Badge(
                            badgeColor: Colors.grey,
                            badgeContent: Text("0",
                                style: TextStyle(color: Colors.white)),
                            position: BadgePosition.topRight(top: 5),
                            child: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      expandedHeight: 200.0,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Container(
                        height: ScreenUtil().setHeight(200),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "http://192.168.100.6/cateringapps/images/pie.jpg"))),
                      )),
                    ),
                  ),
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rp 33.7842',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: ScreenUtil().setSp(25)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 4, bottom: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Kue Kering',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Product Title',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(17)),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1.0,
                ),
                SizedBox(height: 10),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 1.0,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Produk Terkait',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ProductItems(
                            price: "10000",
                            margin: 5,
                            productName: "Hewew",
                            idProduct: "1",
                            productImage:
                                "http://192.168.100.6/cateringapps/images/058C20200612.jpg",
                          )),
                  height: ScreenUtil().setHeight(260),
                  width: MediaQuery.of(context).size.width - 20,
                )
              ]),
            )));
  }
}
