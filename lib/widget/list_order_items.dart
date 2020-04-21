import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOrderItems extends StatelessWidget {
  final ResponsiveLayout responsiveLayout;

  const ListOrderItems({Key key, this.responsiveLayout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5, right: 15, left: 15),
      padding: EdgeInsets.all(15),
      height: ScreenUtil().setHeight(160),
      width: MediaQuery.of(context).size.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Order No : '),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    '65343',
                    style: TextStyle(color: Colors.white),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              height: 2.0,
              thickness: 1.0,
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.network(
                  "https://assets-a2.kompasiana.com/items/album/2017/03/14/kue-indomie-2-58c7fbdc84afbdde0704279a.jpg?t=o&v=760",
                  width: ScreenUtil().setWidth(70),
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Kue Ulang Tahun',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                        )),
                    Text(
                      'RP 200.000',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(19)),
                    Text(
                      '2020-09-20',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                          fontSize: ScreenUtil().setSp(13)),
                    )
                  ],
                ),
                Container(
                  child: Text(
                    'x2',
                    style: TextStyle(color: Colors.white),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  decoration:
                      BoxDecoration(color: Colors.grey.withOpacity(0.8)),
                )
              ],
            ),
          ]),
    );
  }
}
