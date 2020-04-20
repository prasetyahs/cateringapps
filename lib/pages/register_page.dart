import 'package:djcateringapps/provider/register_provider.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);
    responsive.responsiveSettings();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/register_img.png',
                  width: ScreenUtil().setWidth(200),
                  height: ScreenUtil().setHeight(200)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "DJ",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "CATERING",
                    style: TextStyle(
                        color: Colors.black, fontSize: ScreenUtil().setSp(20)),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "SIGN UP PAGE",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontSize: ScreenUtil().setSp(12)),
                  )),
              Consumer<RegisterProvider>(
                builder: (BuildContext context, RegisterProvider value,
                    Widget child) {
                  return value.postResponse.message != null
                      ? Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            value.postResponse.message,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ))
                      : Container(width: 0.0, height: 0.0);
                },
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: name,
                          validator: (val) =>
                              val.isEmpty ? '*Name Required' : null,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person), hintText: "Name"),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: username,
                          validator: (val) =>
                              val.isEmpty ? '*Username Required' : null,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: "Username"),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextFormField(
                          controller: password,
                          validator: (value) =>
                              value.isEmpty ? '*Password Required' : null,
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              hintText: 'Password'),
                          textAlignVertical: TextAlignVertical.bottom,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Text(
                            "Sudah Punya Akun ?",
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                          onTap: ()=>Navigator.pushNamed(context, '/loginPage'),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: MediaQuery.of(context).size.width,
                        child: Consumer<RegisterProvider>(
                          builder: (BuildContext context,
                              RegisterProvider value, Widget child) {
                            return RaisedButton(
                              color: Colors.redAccent,
                              onPressed: () => formKey.currentState.validate()
                                  ? value.usersRegister(
                                      username.text, password.text, name.text)
                                  : null,
                              child: Text(
                                "LOG IN",
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
