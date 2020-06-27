import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/widget/carousel_sldr.dart';
import 'package:djcateringapps/widget/product_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
          Widget>[
        CarouselSldr(),
        Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Beberapa Produk',
                      style: TextStyle(fontSize: ScreenUtil().setSp(13)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                height: ScreenUtil().setHeight(250),
                child:
                    Consumer<IndexProvider>(builder: (context, value, child) {
                  if (value.products == null) {
                    value.setProductAll();
                  }
                  return value.products != null
                      ? NotificationListener<OverscrollIndicatorNotification>(
                          onNotification: (val) {
                            val.disallowGlow();
                            return true;
                          },
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: value.products.row >= 5
                                  ? 4
                                  : value.products.row,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: () => Navigator.pushNamed(
                                        context, '/detailProduct',
                                        arguments: value.products.product
                                            .elementAt(index)),
                                    child: ProductItems(
                                      productName: value.products.product
                                          .elementAt(index)
                                          .productName,
                                      productImage: BaseUrl.BASE_URL_IMAGE +
                                          value.products.product
                                              .elementAt(index)
                                              .productImage,
                                      productDesc: value.products.product
                                          .elementAt(index)
                                          .productDescription,
                                      price: value.products.product
                                          .elementAt(index)
                                          .price,
                                      idProduct: value.products.product
                                          .elementAt(index)
                                          .idProduct,
                                      margin: 5,
                                    ),
                                  )),
                        )
                      : Center(child: CircularProgressIndicator());
                }))
          ]),
        )
      ]),
    );
  }
}
