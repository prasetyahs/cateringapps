import 'package:djcateringapps/widget/list_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {


  @override
  void initState() {
    super.initState();
    
  
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBox) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.orange,
              automaticallyImplyLeading: true,
              expandedHeight: 200,
              floating: false,
              pinned: true,
              centerTitle: true,
              title: Text("Home"),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                collapseMode: CollapseMode.none,
                background: new Center(
                  child: Text('hello world'),
                ),
              ),
            ),
          ];
        },
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              height: 40,
              color: Colors.amber,
            ),
          ],
        ));
  }
}
