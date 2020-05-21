import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductPopularItems extends StatelessWidget {
  final ResponsiveLayout responsiveLayout;
  final double widthImage;

  const ProductPopularItems({Key key, this.responsiveLayout, this.widthImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, right: 15, left: 15),
      color: Colors.white,
      height: ScreenUtil().setHeight(100),
      padding: EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            "https://assets-a2.kompasiana.com/items/album/2017/03/14/kue-indomie-2-58c7fbdc84afbdde0704279a.jpg?t=o&v=760",
            width: widthImage,
            fit: BoxFit.cover,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Kue Ulang Tahun',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                    ],
                  ),
                  Text(
                    'Rp 200.000/Pcs',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14), color: Colors.red),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
