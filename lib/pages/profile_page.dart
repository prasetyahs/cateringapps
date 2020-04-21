import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Badge(
            position: BadgePosition.bottomRight(),
            badgeContent: InkWell(
              onTap: () {},
              child: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 25,
              ),
            ),
            child: Container(
                width: ScreenUtil().setWidth(120),
                height: ScreenUtil().setHeight(120),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://photographyinhu.com/wp-content/uploads/2019/10/Foto-Close-Up-Inhu.jpg")))),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Text(
              'Prasetya Hadi Saputra',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ScreenUtil().setSp(17)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            color: Colors.white,
            padding: EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Informasi Lengkap',
                      style: TextStyle(color: Colors.redAccent)),
                  Form(
                    child: Column(children: <Widget>[
                      Container(
                          height: ScreenUtil().setHeight(40),
                          child: TextFormField()),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          height: ScreenUtil().setHeight(40),
                          child: TextFormField()),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          height: ScreenUtil().setHeight(40),
                          child: TextFormField()),
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          height: ScreenUtil().setHeight(40),
                          child: TextFormField()),
                    ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.redAccent,
                              child: Text("UBAH PASSWORD",
                                  style: TextStyle(color: Colors.white)),
                            )),
                        Container(
                            width: MediaQuery.of(context).size.width / 2 - 20,
                            child: RaisedButton(
                              onPressed: () {},
                              color: Colors.blueAccent,
                              child: Text(
                                'EDIT AKUN',
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ],
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
