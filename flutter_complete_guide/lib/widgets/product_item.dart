import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /* Avec Provider.of, le Builder principal du Widget est re-exécuté
      lorsque des données changent : */
    final product = Provider.of<Product>(context, listen: false);

    /* Avec "Consumer<>", on ne re-exécuter que des sous-parties du Widget-Tree,
      lorsque certaines données changent : */
    return Consumer<Product>(
      builder: (ctx, product, child) {
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
                leading: IconButton(
                    icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      product.toggleFavoriteStatus();
                    },
                    color: Theme.of(context).accentColor),
                trailing: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {},
                    color: Theme.of(context).accentColor)),
          ),
        );
      }
    );


  }
}
