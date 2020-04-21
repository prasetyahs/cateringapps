import 'package:djcateringapps/widget/list_order_items.dart';
import 'package:flutter/cupertino.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => ListOrderItems());
  }
}
