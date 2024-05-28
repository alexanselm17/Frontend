import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/utils/product_tile.dart';
import 'package:shop0koa_frontend/view/screens/products/add_product.dart';

class CataloguePage extends StatelessWidget {
  const CataloguePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
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
        child: ListView.builder(
          // physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (_, index) {
            return const ProductTile(
              isAnalytics: false,
              productName: 'soko maize meal -5 kg',
              leftUnits: '45',
              productPrice: '389',
              productImage:
                  'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              productDiscount: '20',
            );
          },
        ),
      ),
    );
  }
}
