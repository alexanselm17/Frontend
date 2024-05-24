import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    required this.title,
    required this.color,
    this.radius = 100,
  });

  final String title;
  final Color color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ));
  }
}
