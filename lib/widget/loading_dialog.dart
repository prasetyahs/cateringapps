import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation(Colors.redAccent),),
            SizedBox(height: 10),
            Text('Memuat')
          ],
        ));
  }
}
