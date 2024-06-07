import 'package:flutter/material.dart';

class CustomInputDecoration extends InputDecoration {
  @override
  final String? labelText;
  @override
  final String? hintText;
  @override
  final suffix;
  @override
  final prefix;

  CustomInputDecoration({
    this.hintText,
    this.labelText,
    this.suffix,
    this.prefix,
  }) : super(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: prefix,
            suffix: suffix,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            labelStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: Colors.grey.shade50, width: 1.0),
            ),
            fillColor: Colors.white,
            filled: true);
}
