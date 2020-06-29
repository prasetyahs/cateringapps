import 'package:djcateringapps/provider/index_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class TopNavbar extends StatelessWidget {
  final bool isVisible;
  final int productFound;

  const TopNavbar({Key key, this.isVisible, this.productFound})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: isVisible ? 40.0 : 0.0,
          color: Colors.white,
          child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '$productFound Produk Tersedia',
                    style: TextStyle(fontSize: 12),
                  ),
                  Consumer<IndexProvider>(
                    builder: (context, value, child) => Row(
                      children: <Widget>[
                        DropdownButton(
                            underline: Container(),
                            icon: Icon(Icons.sort),
                            items: ['Kue Kering', 'Kue Basah']
                                .map((e) => DropdownMenuItem(
                                        child: Text(
                                      e,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(14)),
                                    )))
                                .toList(),
                            value: null,
                            onChanged: (val) {
                              value.sortCategory();
                              
                            }),
                        // InkWell(
                        //     onTap: () {},
                        //     child: Icon(
                        //       Icons.import_export,
                        //       size: 20,
                        //     )),
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
