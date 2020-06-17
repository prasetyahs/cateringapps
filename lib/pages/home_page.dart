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
                            child: Text('Lihat Lainnya',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(13),
                                    color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: ScreenUtil().setHeight(260),
                        child: Consumer<IndexProvider>(
                            builder: (context, value, child) {
                          if (value.products == null) {
                            value.setProductAll();
                          }
                          return value.products != null
                              ? ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: value.products.row >= 5
                                      ? 5
                                      : value.products.row,
                                  itemBuilder: (context, index) => ProductItems(
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
                                        price: "Rp " +
                                            value.products.product
                                                .elementAt(index)
                                                .price +
                                            ",00",
                                        idProduct: value.products.product
                                            .elementAt(index)
                                            .idProduct,
                                        margin: 5,
                                      ))
                              : Center(child: CircularProgressIndicator());
                        }))
                  ]),
            )
          ]),
    );
  }
}
