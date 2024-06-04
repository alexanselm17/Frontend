import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/utils/custom_badge.dart';

class OdersCard extends StatelessWidget {
  final Color color;
  final String state;
  const OdersCard({super.key, required this.color, required this.state});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(),
      title: const Text('Order name'),
      subtitle: const Text('Oder No. 34374284'),
      trailing: CustomBadge(
        title: state,
        color: color,
        radius: 4,
      ),
    );
  }
}
