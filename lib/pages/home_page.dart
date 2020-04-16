import 'package:djcateringapps/pages/product_page.dart';
import 'package:djcateringapps/widget/sidebar_menu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ProductPage(),
       
        drawer: Drawer(
          child: Sidebar(),
        ));
  }
}
