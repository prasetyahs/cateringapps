import 'package:djcateringapps/model/product/product.dart';
import 'package:djcateringapps/model/product/products.dart';
import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/repository/base_url.dart';
import 'package:djcateringapps/repository/product_repository.dart';
import 'package:djcateringapps/widget/product_items.dart';
import 'package:djcateringapps/widget/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final ScrollController scrollController = ScrollController();
  ProductRepository productRepository = ProductRepository();
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible)
          setState(() {
            isVisible = true;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = (ScreenUtil().setHeight(170)) / 2;
    final double itemWidth = ScreenUtil().setWidth(110) / 2;
    return Column(
      children: <Widget>[
        Consumer<IndexProvider>(
            builder: (context, value, child) => value.products != null
                ? TopNavbar(
                    productFound: value.products.row,
                    isVisible: isVisible,
                  )
                : TopNavbar(
                    productFound: 0,
                    isVisible: isVisible,
                  )),
        Expanded(
          child: Container(
              margin:
                  EdgeInsets.only(top: isVisible ? 10 : 5, left: 15, right: 15),
              height: MediaQuery.of(context).size.height,
              child: Consumer<IndexProvider>(builder: (context, value, child) {
                if (value.products == null) {
                  value.setProductAll();
                }
                return value.products != null
                    ? GridView.builder(
                        controller: scrollController,
                        itemCount: value.products.row,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: itemWidth / itemHeight,
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                        ),
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
                            ))
                    : Center(child: CircularProgressIndicator());
              })),
        ),
      ],
    );
  }
}
