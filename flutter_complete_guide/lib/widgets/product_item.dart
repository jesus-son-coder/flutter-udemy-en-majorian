import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GridTile(
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
              },
              child: Image.network(product.imageUrl, fit: BoxFit.cover),
            ),
            footer: GridTileBar(
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.black54,
                leading: Consumer<Product>(
                    builder: (ctx, product, child)  => IconButton(
                      icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
                      onPressed: () {
                        product.toggleFavoriteStatus();
                      },
                      color: Theme.of(context).accentColor),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      cart.addItem(product.id, product.price, product.title);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('Added item to cart', textAlign: TextAlign.center,),
                          duration: Duration(seconds: 3),
                          action: SnackBarAction(
                            label: 'Annuler',
                            onPressed: () {
                              cart.removeSingleItem(product.id);
                            },
                          )
                      ));
                    },
                    color: Theme.of(context).accentColor)),
          ),
        );

  }
}
