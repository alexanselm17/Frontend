import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/utils/Vertical_spacing.dart';
import 'package:shop0koa_frontend/utils/button.dart';
import 'package:shop0koa_frontend/utils/custom_badge.dart';
import 'package:shop0koa_frontend/utils/custom_cached_network_image.dart';
import 'package:shop0koa_frontend/view/screens/products/product_analytics.dart';

class ProductTile extends StatelessWidget {
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomCachedNetworkImage(
              image: productImage,
              height: 100,
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
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black),
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpacing(height: 5),
                  CustomBadge(
                    title: "$leftUnits Units Left",
                    color: AppColors.mainColor,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    children: [
                      Text(
                        "Ksh. $productPrice",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Ksh.$productDiscount",
                        style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  ),
                  const VerticalSpacing(height: 0),
                  !isAnalytics
                      ? Row(
                          children: [
                            const CustomBadge(
                              title: 'Edit',
                              color: Colors.black,
                            ),
                            const SizedBox(width: 10),
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushNamed(ProductAnalytics.routeName),
                              //Get.to(const ProductAnalytics()),
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
                              padding: 5,
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
