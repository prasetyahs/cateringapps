import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/images2.png',
            width: 200,
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "DJ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              SizedBox(width: 5),
              Text(
                "CATERING",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
          Container(margin:EdgeInsets.only(top:5),child: Text("LOG IN PAGE",style: TextStyle(color:Colors.grey.withOpacity(0.8),fontSize:12),)),
          Form(
              child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person), hintText: "Username"),
                  textAlignVertical: TextAlignVertical.bottom,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock), hintText: 'Password'),
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
              onTap: () {},
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: RaisedButton(
              onPressed: () {},
              color: Colors.orange,
              child: new Text(
                "LOG IN",
                style: TextStyle(color: Colors.white),
              ),
            ),
            width: MediaQuery.of(context).size.width,
          )
        ],
      ),
    ));
  }
}
