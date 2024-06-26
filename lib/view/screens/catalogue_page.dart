import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/models/catalogue/catalogue.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/provider/catalogueProvider.dart';
import 'package:shop0koa_frontend/view/widgets/product_tile.dart';
import 'package:shop0koa_frontend/view/screens/products/add_product.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  bool _isInit = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      _isInit = false;
      final String storeId =
          context.watch<AuthProvider>().user!.store!.id.toString();
      context.read<CatalogueProvider>().getProducts(storeId: storeId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            //Get.back();
          },
        ),
        title: const Text('Catalog'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.mainColor,
          onPressed: () {
            Navigator.of(context).pushNamed(AddProduct.routeName);
          },
          label: const Row(
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              Text(
                'Add Product',
                style: TextStyle(color: Colors.white),
              )
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: context.watch<CatalogueProvider>().isLoading
            ? const Center(child: CircularProgressIndicator())
            : context.watch<CatalogueProvider>().catalogue!.products!.isEmpty
                ? const Center(
                    child: Text(
                        "You don't have any products in the catalogue yet"),
                  )
                : ListView.builder(
                    // physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: context
                        .watch<CatalogueProvider>()
                        .catalogue!
                        .products!
                        .length,
                    itemBuilder: (_, index) {
                      final Products product = context
                          .watch<CatalogueProvider>()
                          .catalogue!
                          .products![index];
                      return ProductTile(
                        products: product,
                        isAnalytics: false,
                        productName: product.name!,
                        leftUnits: product.quantity.toString(),
                        productPrice: product.price.toString(),
                        productImage: product.url!,
                        productDiscount: product.discount.toString(),
                      );
                    },
                  ),
      ),
    );
  }
}
