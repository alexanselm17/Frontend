import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/view/widgets/oder_card.dart';

class FlexiSave extends StatelessWidget {
  const FlexiSave({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Pending'),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (_, index) {
            return OdersCard(
              color: Colors.grey.shade400,
              state: 'UNPICKED',
            );
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Completed'),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (_, index) {
            return OdersCard(
              color: AppColors.mainColor,
              state: 'PICKED',
            );
          },
        ),
      ],
    );
  }
}
