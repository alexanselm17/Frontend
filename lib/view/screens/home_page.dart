import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/utils/Vertical_spacing.dart';
import 'package:shop0koa_frontend/utils/product_tile.dart';
import 'package:shop0koa_frontend/view/screens/oders/oders_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      CircleAvatar(),
                      SizedBox(width: 10),
                      Text('Merchant Name'),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  )
                ],
              ),
              const VerticalSpacing(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Your Balance  ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(Icons.visibility)
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'View more ',
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    decorationColor: AppColors.mainColor,
                                    decorationStyle: TextDecorationStyle.solid),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print('Text tapped!');
                                    // Perform your action here
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(),
                    Container(
                      width: MediaQuery.of(context).size.width - 10,
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.green,
                            Colors.green,
                            Colors.black,
                          ],
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'Ksh. 456,890,670',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade200,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Text(
                              'Pending Oders ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Icon(Icons.access_time_rounded)
                          ],
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'View more ',
                                style: TextStyle(
                                    color: AppColors.mainColor,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2,
                                    decorationColor: AppColors.mainColor,
                                    decorationStyle: TextDecorationStyle.solid),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context)
                                        .pushNamed(OrdersPage.routeName);
                                    //(const OdersPage());
                                    print('Text tapped!');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const VerticalSpacing(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OdersCard(oderType: 'Pick Up', oderAmount: 30),
                        OdersCard(oderType: 'Deliveries', oderAmount: 10),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(),
              const Text(
                'Catalogue',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const ProductTile(
                isAnalytics: false,
                productName: 'soko maize meal -5 kg',
                leftUnits: '45',
                productPrice: '389',
                productImage:
                    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                productDiscount: '20',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OdersCard extends StatelessWidget {
  final String oderType;
  final int oderAmount;
  const OdersCard({
    super.key,
    required this.oderType,
    required this.oderAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.width * 0.25,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.mainColor),
          child: Center(
            child: Text(
              oderAmount.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
        ),
        const VerticalSpacing(),
        Text(
          oderType,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
