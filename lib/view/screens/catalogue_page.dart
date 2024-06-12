import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/models/catalogue/catalogue.dart';
import 'package:shop0koa_frontend/provider/catalogueProvider.dart';
import 'package:shop0koa_frontend/view/widgets/product_tile.dart';
import 'package:shop0koa_frontend/view/screens/products/add_product.dart';

class CataloguePage extends StatefulWidget {
  const CataloguePage({super.key});

  @override
  State<CataloguePage> createState() => _CataloguePageState();
}

class _CataloguePageState extends State<CataloguePage> {
  @override
  void initState() {
    final catalogueProvider =
        Provider.of<CatalogueProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      catalogueProvider.getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final catalogueProvider =
        Provider.of<CatalogueProvider>(context, listen: true);

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
        child: catalogueProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : catalogueProvider.catalogue!.products!.isEmpty
                ? const Center(
                    child:
                        Text('You dont have any products in the catalogue yet'),
                  )
                : ListView.builder(
                    // physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: catalogueProvider.catalogue!.products!.length,
                    itemBuilder: (_, index) {
                      final Products product =
                          catalogueProvider.catalogue!.products![index];
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
