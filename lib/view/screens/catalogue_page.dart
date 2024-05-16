import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/utils/product_tile.dart';

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
            Get.back();
          },
        ),
        title: const Text('Catalog'),
      ),
      body: ListView.builder(
        // physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (_, index) {
          return const ProductTile(
            isAnalytics: false,
            productName: 'productName',
            leftUnits: '45',
            productPrice: '389',
            productImage:
                'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            productDiscount: '20',
          );
        },
      ),
    );
  }
}
