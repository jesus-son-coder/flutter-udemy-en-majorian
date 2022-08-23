import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* Avec Provider.of, le Builder principal du Widget est re-exécuté
      lorsque des données changent : */
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
                /* On peut encore limiter la section à mettre à jour avec "Consumer<>" lorsque certaines données changent : */
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
                    },
                    color: Theme.of(context).accentColor)),
          ),
        );

  }
}
