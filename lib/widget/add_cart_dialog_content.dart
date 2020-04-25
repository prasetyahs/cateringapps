import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCartDialogContent extends StatelessWidget {
  final String imageContent, productName, productPrice;

  const AddCartDialogContent(
      {Key key, this.imageContent, this.productName, this.productPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280),
      padding: EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Jumlah Yang Ingin Di Beli',
                  style: TextStyle(fontSize: ScreenUtil().setHeight(15)),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Icons.close,
                      size: ScreenUtil().setWidth(20),
                    ),
                  ),
                  onTap: () => Navigator.pop(context),
                )
              ],
            ),
            Divider(
              thickness: 1.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network(
                  imageContent,
                  width: ScreenUtil().setHeight(60),
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(productName),
                    SizedBox(height: 6),
                    Row(
                      children: <Widget>[
                        Container(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          child: RaisedButton(
                            color: Colors.redAccent,
                            child: Text(
                              '+',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(17),
                                  color: Colors.white),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("100",
                            style: TextStyle(
                              fontSize: ScreenUtil().setSp(17),
                            )),
                        SizedBox(width: 10),
                        Container(
                          width: ScreenUtil().setWidth(40),
                          height: ScreenUtil().setHeight(40),
                          child: RaisedButton(
                            color: Colors.redAccent,
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(17),
                                  color: Colors.white),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Text(productPrice,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: ScreenUtil().setSp(13),
                )),
            SizedBox(height: 10),
            Divider(thickness: 1.0),
            Text(
              'SUBTOTAL',
              style: TextStyle(
                  fontSize: ScreenUtil().setHeight(11),
                  color: Colors.grey.withOpacity(0.8)),
            ),
            Text("Rp6000"),
            Container(
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  child: Text(
                    'LANJUT ORDER',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                  color: Colors.redAccent,
                ))
          ]),
    );
  }
}
