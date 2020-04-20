import 'package:djcateringapps/provider/login_provider.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final username = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final usersRepo = LoginProvider();
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

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveLayout(context);
    responsive.responsiveSettings();

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/images2.png',
                width: ScreenUtil().setWidth(200),
                height: ScreenUtil().setHeight(200),
              ),
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
                    "LOG IN PAGE",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.8),
                        fontSize: ScreenUtil().setSp(12)),
                  )),
              Consumer<LoginProvider>(
                builder:
                    (BuildContext context, LoginProvider value, Widget child) {
                  return value.message != null
                      ? Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            value.message,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ))
                      : null;
                },
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
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
                      )
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 15),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    "Tidak Punya Akun ?",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  onTap: () => Navigator.pushNamed(context, '/registerPage'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Consumer<LoginProvider>(
                  builder: (BuildContext context, LoginProvider value,
                      Widget child) {
                    return RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          showDialog().then((valueDialog) => {
                                value
                                    .onLogin(username.text, password.text)
                                    .then((value) => value.auth != null &&
                                            value.auth &&
                                            value.data != null
                                        ? Navigator.pushNamedAndRemoveUntil(
                                            context,
                                            '/homePage',
                                            (route) => false)
                                        : null)
                                    .whenComplete(() => hideDialog())
                              });
                        } else {
                          hideDialog();
                        }
                      },
                      color: Colors.redAccent,
                      child: Text(
                        "LOG IN",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                width: MediaQuery.of(context).size.width,
              )
            ],
          ),
        ));
  }
}
