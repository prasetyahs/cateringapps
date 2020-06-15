import 'package:djcateringapps/repository/base_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class RowDetailOrder extends StatelessWidget {
  final String imageProduct, productName, amountProduct, price;

  const RowDetailOrder(
      {Key key,
      this.imageProduct,
      this.productName,
      this.amountProduct,
      this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        margin: EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: ScreenUtil().setWidth(50),
              height: ScreenUtil().setHeight(40),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image:
                          NetworkImage(BaseUrl.BASE_URL_IMAGE + imageProduct))),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName,
                          style: TextStyle(fontSize: ScreenUtil().setSp(14))),
                      SizedBox(height: 5),
                      Text(
                        '{$amountProduct} X IDR ${price}',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenUtil().setSp(14)),
                      )
                    ])),
          ],
        ),
      ),
    ]);
  }
}
