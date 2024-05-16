import 'package:flutter/material.dart';
import 'package:shop0koa_frontend/constants/colors.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ));
  }
}
