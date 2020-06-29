import 'package:badges/badges.dart';
import 'package:djcateringapps/model/login/data.dart';
import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/widget/dialog_edit_password.dart';
import 'package:djcateringapps/widget/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameText = TextEditingController();
  final TextEditingController usernameText = TextEditingController();
  final TextEditingController telpText = TextEditingController();
  final TextEditingController addressText = TextEditingController();
  final TextEditingController emailText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<IndexProvider>(
      builder: (context, value, child) => FutureBuilder(
          future: value.users(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              nameText.text = snapshot.data.name;
              usernameText.text = snapshot.data.username;
              telpText.text = snapshot.data.phone;
              addressText.text = snapshot.data.address;
              emailText.text = snapshot.data.email;
              return Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (notification) {
                    notification.disallowGlow();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(children: [
                        Center(
                          child: Badge(
                            position:
                                BadgePosition.bottomRight(right: 5, bottom: 1),
                            badgeContent: InkWell(
                              onTap: () {},
                              child: Container()/*Icon(
                                Icons.photo_camera,
                                color: Colors.white,
                              ),*/
                            ),
                            child: ClipOval(
                              child: Image.network(
                                "https://www.blibli.com/friends/assets/2019/03/shutterstock_765780592.jpg",
                                fit: BoxFit.cover,
                                width: ScreenUtil().setWidth(100),
                                height: ScreenUtil().setHeight(100),
                              ),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Nama'),
                                  ],
                                ),
                                Container(
                                    height: ScreenUtil().setHeight(45),
                                    child: TextField(
                                      controller: nameText,
                                      readOnly: value.isEdit,
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('Username'),
                                  ],
                                ),
                                Container(
                                    height: ScreenUtil().setHeight(45),
                                    child: TextField(
                                      controller: usernameText,
                                      readOnly: value.isEdit,
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('Email'),
                                  ],
                                ),
                                Container(
                                    height: ScreenUtil().setHeight(45),
                                    child: TextField(
                                      controller: emailText,
                                      readOnly: value.isEdit,
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('Telp'),
                                  ],
                                ),
                                Container(
                                    height: ScreenUtil().setHeight(45),
                                    child: TextField(
                                      controller: telpText,
                                      readOnly: value.isEdit,
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('Alamat'),
                                  ],
                                ),
                                Container(
                                    height: ScreenUtil().setHeight(50),
                                    child: TextField(
                                      controller: addressText,
                                      maxLines: 3,
                                      readOnly: value.isEdit,
                                    )),
                                SizedBox(height: 10),
                                Container(
                                    child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          15,
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            side:
                                                BorderSide(color: Colors.red)),
                                        onPressed: () {
                                          if (value.isEdit) {
                                            value.setIsEdit(false);
                                          } else {
                                            showDialog(
                                                context: context,
                                                child: Dialog(
                                                    child: LoadingDialog()));
                                            value
                                                .editAccount(
                                                    usernameText.text,
                                                    nameText.text,
                                                    emailText.text,
                                                    telpText.text,
                                                    addressText.text,
                                                    snapshot.data.idUsers)
                                                .then((value) =>
                                                    Navigator.pop(context))
                                                .whenComplete(() {
                                              Data data = Data(
                                                  snapshot.data.idUsers,
                                                  nameText.text,
                                                  usernameText.text,
                                                  telpText.text,
                                                  addressText.text,
                                                  snapshot.data.image,
                                                  emailText.text);
                                              value.editSession(data);
                                              value.setIsEdit(true);
                                            });
                                          }
                                        },
                                        child: Text(
                                          value.isEdit ? 'Ubah Akun' : "Simpan",
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                              2 -
                                          15,
                                      child: FlatButton(
                                        color: Colors.red,
                                        onPressed: () => showDialog(
                                            context: context,
                                            child: Dialog(
                                              child:
                                                  ChangeNotifierProvider.value(
                                                value: IndexProvider(),
                                                child: DialogEditPassword(id: snapshot.data.idUsers,),
                                              ),
                                            )),
                                        child: Text(
                                          'Ubah Password',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ))
                              ],
                            )),
                      ]),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
