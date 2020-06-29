import 'package:djcateringapps/provider/login_provider.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final loginPr = LoginProvider();

  @override
  void initState() {
    super.initState();
    loginPr.auth().then((value) => value != null && value
        ? Navigator.pushNamedAndRemoveUntil(
            context, '/homePage', (route) => false)
        : null);
  }

  @override
  Widget build(BuildContext context) {
    var responsive = ResponsiveLayout(context);
    responsive.responsiveSettings();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/images1.png',
                width: ScreenUtil().setWidth(150),
                height: ScreenUtil().setHeight(150),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Pesan",
                      style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Makananmu",
                      style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(20)),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Pesan Melalui App ini",
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey.withOpacity(0.8)),
                  )),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
                  onPressed: () => Navigator.pushNamed(context, '/loginPage'),
                  child: new Text(
                    "LOG IN",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/registerPage'),
                  color: Colors.redAccent,
                  child: Text(
                    "DAFTAR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
