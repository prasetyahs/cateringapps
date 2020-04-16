import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal:20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/images1.png',
                width: 150,
                height: 150,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Pesan",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Makananmu",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Pesan Melalui App ini",
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey.withOpacity(0.8)),
                  )),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: OutlineButton(
                  borderSide: BorderSide(color: Colors.orange, width: 1.0),
                  onPressed: () {},
                  child: new Text(
                    "LOG IN",
                    style: TextStyle(color: Colors.orange),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                child: RaisedButton(
                  onPressed: () {},
                  color: Colors.orange,
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
