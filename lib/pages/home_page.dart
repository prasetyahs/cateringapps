import 'package:djcateringapps/widget/carousel_sldr.dart';
import 'package:djcateringapps/widget/product_popular_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSldr(),
            Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Beberapa Produk',
                              style:
                                  TextStyle(fontSize: ScreenUtil().setSp(13)),
                            ),
                          ),
                          Container(
                            child: Text('See More',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(13),
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(420),
                      child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) => ProductPopularItems(
                                widthImage: ScreenUtil().setWidth(120),
                              )),
                    )
                  ]),
            )
          ]),
    );
  }
}
