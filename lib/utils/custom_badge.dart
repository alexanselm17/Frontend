import 'package:flutter/material.dart';

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
            borderRadius: const BorderRadius.all(Radius.circular(100))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ));
  }
}
