import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/product_item.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/utils/app_routes.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  Future<void> _refreshProducts(BuildContext context) {
    // sempre listen = false porque o Provider não esta dentro da arvore de componentes
    return Provider.of<ProductList>(context, listen: false).loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    final ProductList products = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Produtos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PRODUCT_FORM);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
            itemBuilder: (ctx, index) => Column(
              children: [
                ProductItem(
                  product: products.items[index],
                ),
                Divider(),
              ],
            ),
            itemCount: products.itemCount,
          ),
        ),
      ),
    );
  }
}
