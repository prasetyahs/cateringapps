import 'package:flutter/material.dart';

class ListCategory extends StatelessWidget {
  final bool _isVisible;

  ListCategory(this._isVisible);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedContainer(
          margin: EdgeInsets.only(top: _isVisible ? 50 : 0),
          duration: Duration(milliseconds: 400),
          height: _isVisible ? 90.0 : 0.0,
          child: new Container(
            color: Colors.green,
            width: MediaQuery.of(context).size.width,
            child: Center(child: Text("Container")),
          )),
    );
  }
}
