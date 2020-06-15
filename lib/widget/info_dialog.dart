import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class DialogInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: ScreenUtil().setHeight(270),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.asset(
              "images/thanks_you.png",
              width: ScreenUtil().setWidth(150),
              height: ScreenUtil().setHeight(150),
            ),
            SizedBox(height: 10),
            Text("TERIMA KASIH TELAH ORDER",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(18)))
          ]),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Close',
                      style: TextStyle(
                        color: Colors.red,
                      ))),
              FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Info Pembayaran',
                      style: TextStyle(
                        color: Colors.blue,
                      ))),
              SizedBox(width: 5)
            ],
          )
        ],
      ),
    );
  }
}
