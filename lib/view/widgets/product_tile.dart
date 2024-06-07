import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/models/catalogue/catalogue.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';
import 'package:shop0koa_frontend/view/widgets/Vertical_spacing.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:shop0koa_frontend/view/widgets/custom_badge.dart';
import 'package:shop0koa_frontend/view/widgets/custom_cached_network_image.dart';

class ProductTile extends StatelessWidget {
  final Products products;
  final bool isAnalytics;
  final String productName;
  final String leftUnits;
  final String productPrice;
  final String productImage;
  final String productDiscount;

  const ProductTile({
    super.key,
    required this.productName,
    required this.leftUnits,
    required this.productPrice,
    required this.productImage,
    required this.productDiscount,
    required this.isAnalytics,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      height: MediaQuery.sizeOf(context).height * .17,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 8,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              image: productImage,
              height: MediaQuery.sizeOf(context).height * .14,
              width: 100,
            ),
            const SizedBox(
              width: 14.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            productName,
                            style: Theme.of(context).textTheme.headlineSmall,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(height: 5),
                  CustomBadge(
                      title: "$leftUnits Units Left",
                      color: AppColors.mainColor),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ksh. $productPrice",
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text("Ksh.$productDiscount",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            decoration: TextDecoration.lineThrough,
                          )),
                    ],
                  ),
                  const VerticalSpacing(height: 0),
                  !isAnalytics
                      ? Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddProduct(
                                            isEdit: true,
                                            product: products,
                                          )),
                                );
                              },
                              child: const CustomBadge(
                                title: 'Edit',
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(ProductAnalytics.routeName),
                              child: const CustomBadge(
                                title: 'Analytics',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: CustomButton(
                              //padding: 5,
                              onTap: () {},
                              text: 'Edit',
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
