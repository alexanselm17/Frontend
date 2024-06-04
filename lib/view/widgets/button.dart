import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final EdgeInsets
      padding; // Moved to Edge Insets to allow one to customize the type of paddding needed instead of EdgeInsets.all
  final double? margin;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.padding = const EdgeInsets.all(20),
    this.margin = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style,
      onPressed: onTap,
      child: Text(text!),
    );
    //   return GestureDetector(
    //     onTap: onTap,
    //     child: Container(
    //       padding: EdgeInsets.all(padding!),
    //       margin: EdgeInsets.symmetric(horizontal: margin!),
    //       decoration: BoxDecoration(
    //         color: Theme.of(context).colorScheme.primary,
    //         borderRadius: BorderRadius.circular(15),
    //       ),
    //       child: Center(
    //         child: Text(text!, style: Theme.of(context).textTheme.bodyLarge),
    //       ),
    //     ),
    //   );
    // }
  }
}
