import 'package:flutter/material.dart';

class TopNavbar extends StatelessWidget {
  final bool _isVisible;

  TopNavbar(this._isVisible);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          height: _isVisible ? 40.0 : 0.0,
          color: Colors.white,
          child: new Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '20 Product Found',
                    style: TextStyle(fontSize: 12),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){},
                          child: Icon(
                        Icons.import_export,
                        size: 20,
                      )),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: (){},
                          child: Icon(
                        Icons.sort,
                        size: 20,
                      )),
                    ],
                  )
                ],
              ))),
    );
  }
}
