import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/view/widgets/product_tile.dart';
import 'package:shop0koa_frontend/view/screens/products/analytics_chart.dart';

class ProductAnalytics extends StatelessWidget {
  static const routeName = 'ProductAnalytics';
  const ProductAnalytics({super.key});

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
          },
        ),
        title: const Text('Analytics'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const ProductTile(
              //   isAnalytics: true,
              //   productName: 'productName',
              //   leftUnits: '45',
              //   productPrice: '500',
              //   productImage:
              //       'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              //   productDiscount: '40',
              // ),
              const Text(
                'Sales',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text('Today'),
                      SalesText(
                        text: '+42',
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Total Sales'),
                      SalesText(
                        text: '908',
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Unique Customers'),
                      SalesText(
                        text: '8',
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text('Returned'),
                      SalesText(
                        text: '9',
                        color: Colors.red,
                      ),
                    ],
                  )
                ],
              ),
              BarChartSample1(),
              Row(
                children: [
                  const Text('Net sells  :'),
                  const SizedBox(width: 5),
                  SalesText(text: 'Ksh .345', color: AppColors.mainColor)
                ],
              ),
              Row(
                children: [
                  const Text('Average star rating  :'),
                  const SizedBox(width: 5),
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const SizedBox(width: 5),
                  SalesText(text: '4.4 (10)', color: AppColors.mainColor),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SalesText extends StatelessWidget {
  final String text;
  final Color color;
  const SalesText({
    super.key,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }
}
