import 'package:badges/badges.dart';
import 'package:djcateringapps/pages/home_page.dart';
import 'package:djcateringapps/pages/order_page.dart';
import 'package:djcateringapps/pages/product_page.dart';
import 'package:djcateringapps/pages/profile_page.dart';
import 'package:djcateringapps/provider/index_provider.dart';
import 'package:djcateringapps/utilities/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  ResponsiveLayout responsiveLayout;
  int _selectIndex = 0;

  @override
  void initState() {
    super.initState();
    responsiveLayout = ResponsiveLayout(context);
  }

  void onTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listMenu = [
      HomePage(),
      ProductPage(),
      OrderPage(),
      ProfilePage()
    ];
    return Scaffold(
        backgroundColor: Color.fromRGBO(240, 240, 240, 257),
        resizeToAvoidBottomInset: false,
        body: listMenu.elementAt(_selectIndex),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.redAccent,
          title: Text('DJ Catering'),
          leading: Consumer<IndexProvider>(
            builder: (context, value, child) => InkWell(
                onTap: () => {
                      value.logout(),
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/', (route) => false)
                    },
                child:
                    Tooltip(message: 'Logout', child: Icon(Icons.exit_to_app))),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 15),
              child: Badge(
                badgeColor: Colors.grey,
                badgeContent: Text(
                  '3',
                  style: TextStyle(color: Colors.white),
                ),
                position: BadgePosition.topRight(top: 5),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectIndex,
            onTap: onTapped,
            backgroundColor: Colors.white,
            elevation: 10.0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey.withOpacity(0.8),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text('Beranda')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.cake), title: Text('Produk')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.swap_horiz), title: Text('Order')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text('Akun')),
            ]));
  }
}
