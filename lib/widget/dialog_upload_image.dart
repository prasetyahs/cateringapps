import 'dart:io';
import 'package:djcateringapps/provider/detail_order_provider.dart';
import 'package:djcateringapps/widget/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DialogUploadImage extends StatefulWidget {
  final String idOrder;

  const DialogUploadImage({Key key, this.idOrder}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DialogUploadImageState(idOrder);
  }
}

class DialogUploadImageState extends State<DialogUploadImage> {
  File imageFile;
  final String idOrder;

  final ImagePicker _picker = ImagePicker();

  DialogUploadImageState(this.idOrder);

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      imageFile = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
        SizedBox(height: 10),
        Container(
            width: MediaQuery.of(context).size.width,
            height: ScreenUtil().setHeight(150),
            decoration: BoxDecoration(border: Border.all()),
            child: imageFile != null
                ? Image.file(imageFile)
                : Container(
                    child: Center(child: Text('Foto Belum Di Upload')))),
        Container(
          width: MediaQuery.of(context).size.width,
          child: FlatButton(
            onPressed: () => getImage(),
            child: Text(
              'Ambil Foto',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Consumer<DetailOrderProvider>(
            builder: (context, value, child) => OutlineButton(
                color: Colors.white,
                borderSide: BorderSide(color: Colors.red),
                onPressed: () {
                  if (imageFile != null) {
                    showDialog(
                        context: context,
                        child: Dialog(
                          child: LoadingDialog(),
                        ));

                    value.uploadPayment(imageFile, idOrder).then((value) {
                      Navigator.pop(context);
                    });
                  } else {
                    Fluttertoast.showToast(
                        msg: "Silahkan Ambil Gambar Terlebih Dahulu",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.white,
                        textColor: Colors.red,
                        fontSize: 16.0);
                  }
                },
                child: Text('Upload')),
          ),
        )
      ]),
    );
  }
}
