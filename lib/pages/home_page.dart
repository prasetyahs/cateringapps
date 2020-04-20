import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:djcateringapps/widget/carousel_sldr.dart';
import 'package:djcateringapps/widget/product_popular_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  final ResponsiveLayout responsiveLayout;

  const HomePage({Key key, this.responsiveLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    responsiveLayout.responsiveSettings();
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CarouselSldr(
              responsiveLayout: responsiveLayout,
            ),
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
                              'Populer Produk',
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
                              responsiveLayout: responsiveLayout)),
                    )
                  ]),
            )
          ]),
    );
  }
}
