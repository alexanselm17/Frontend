import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  final double? height;
  const VerticalSpacing({Key? key, this.height = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
