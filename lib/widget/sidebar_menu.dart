import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://www.superprof.co.id/gambar/guru/rumah-guru-cewe-yang-hanya-hobi-makeup-sehingga-kehobiannya-bisa-membuka-bisnis-mua-dikota-medan.jpg')))),
            Container(
              child: Text(
                'Prasetya Hadi Saputra',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              margin: EdgeInsets.only(top: 15),
            ),
            Container(
              margin: EdgeInsets.only(top: 3),
              child: Text(
                'prasetya@gmail.com',
                style: TextStyle(color: Colors.grey.withOpacity(0.8)),
              ),
            ),
            SizedBox(height: 12),
            Divider(thickness: 2.0),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.home, color: Colors.grey.withOpacity(0.8)),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.list, color: Colors.grey.withOpacity(0.8)),
                    SizedBox(width: 10),
                    Text(
                      'Riwayat Order',
                      style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.person, color: Colors.grey.withOpacity(0.8)),
                    SizedBox(width: 10),
                    Text(
                      'Akun',
                      style: TextStyle(color: Colors.grey.withOpacity(0.8)),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Divider(
                            thickness: 2.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.exit_to_app,
                                    color: Colors.grey.withOpacity(0.8),
                                  ),
                                  SizedBox(width: 10),
                                  Text('Keluar',
                                      style: TextStyle(
                                        color: Colors.grey.withOpacity(0.8),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
