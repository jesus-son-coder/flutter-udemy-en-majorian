import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart'; // show Cart
import '../providers/orders.dart'; // show Cart
import '../widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total', style: TextStyle(fontSize: 20),),
                  Spacer(),
                  SizedBox(width: 10,),
                  Chip(
                    label: Text(
                        '\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white)
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                      child: Text('COMMANDER'),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false)
                            .addOrder(cart.items.values.toList(), cart.totalAmount);
                        cart.clear();
                      },
                  )
                ]
              )
            )
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) =>
                  ci.CartItem(
                      cart.items.values.toList()[i].id,
                      cart.items.keys.toList()[i],
                      cart.items.values.toList()[i].price,
                      cart.items.values.toList()[i].quantity,
                      cart.items.values.toList()[i].title
                  ),
            )
          )
        ]
      )
    );
  }
}
