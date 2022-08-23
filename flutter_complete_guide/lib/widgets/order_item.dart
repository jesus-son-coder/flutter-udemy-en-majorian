import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    // final orders = Provider.of<Orders>(context);
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ListTile(
                title: Text('\$${order.amount}'),
                subtitle: Text(
                  DateFormat('dd MM yyyy hh:mm').format(order.dateTime),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.expand_more),
                  onPressed: () {},
                ))
          ],
        ));
  }
}
