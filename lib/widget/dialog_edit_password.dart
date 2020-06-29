import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class DialogEditPassword extends StatelessWidget {
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController pPassword = TextEditingController();
  final id;

  DialogEditPassword({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: ScreenUtil().setHeight(300),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Ubah Password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: ScreenUtil().setSp(20)),
              ),
              IconButton(
                  icon: Icon(
                    Icons.close,
                    size: ScreenUtil().setHeight(20),
                  ),
                  onPressed: () => Navigator.pop(context))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 19),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Password Lama"),
                Container(
                    child: TextField(
                      controller: pPassword,
                      obscureText: true,
                    ),
                    height: ScreenUtil().setHeight(40)),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Password Baru"),
                Container(
                  child: TextField(
                    controller: newPassword,
                    obscureText: true,
                  ),
                  height: ScreenUtil().setHeight(40),
                ),
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Consumer<IndexProvider>(
                builder: (context, value, child) => RaisedButton(
                  onPressed: () {
                    showDialog(context: context, child: LoadingDialog());
                    value
                        .editPassword(id, newPassword.text, pPassword.text)
                        .then((value) {
                      Fluttertoast.showToast(
                          msg: value.message.toString(),
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    });
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  child: Text(
                    "Ubah Password",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
