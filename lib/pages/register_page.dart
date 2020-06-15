import 'package:djcateringapps/provider/register_provider.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _passwordFucos = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  ProgressDialog pr;

  @override
  void initState() {
    super.initState();
    pr = new ProgressDialog(context);
    pr.style(
        message: "Mohon Tunggu",
        backgroundColor: Colors.white,
        elevation: 10.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 12.0, fontWeight: FontWeight.w400),
        progressWidget: Container(
            padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
        insetAnimCurve: Curves.easeInOut);
  }

  Future<bool> showDialog() async {
    return await pr.show();
  }

  hideDialog() async {
    return await pr.hide();
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);
    responsive.responsiveSettings();
    return Scaffold(
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
                          focusNode: _nameFocus,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (val) => _fieldFocusChange(
                              context, _nameFocus, _usernameFocus),
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
                          focusNode: _usernameFocus,
                          controller: username,
                          onFieldSubmitted: (val) => _fieldFocusChange(
                              context, _usernameFocus, _passwordFucos),
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
                          focusNode: _passwordFucos,
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
                          onTap: () =>
                              Navigator.pushNamed(context, '/loginPage'),
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
