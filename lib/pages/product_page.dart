import 'package:djcateringapps/widget/product_items.dart';
import 'package:djcateringapps/widget/top_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final ScrollController scrollController = ScrollController();
  bool isVisible = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible)
          setState(() {
            isVisible = true;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double itemHeight = (180) / 2;
    final double itemWidth = 100 / 2;
    return Column(
      children: <Widget>[
        TopNavbar(isVisible),
        Expanded(
          child: Container(
            margin:
                EdgeInsets.only(top: isVisible ? 10 : 5, left: 15, right: 15),
            height: MediaQuery.of(context).size.height,
            child: GridView.count(
                childAspectRatio: itemWidth / itemHeight,
                controller: scrollController,
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                children: <Widget>[
                  ProductItems(),
                  ProductItems(),
                  ProductItems(),
                  ProductItems(),
                  ProductItems(),
                  ProductItems(),
                  ProductItems(),
                  ProductItems(),
                ]),
          ),
        ),
      ],
    );
  }
}
