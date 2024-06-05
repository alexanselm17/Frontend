import 'package:flutter/material.dart';

class CustomProgressDialog extends StatelessWidget {
  final String status;
  const CustomProgressDialog({super.key, required this.status});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4.0)),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            const CircularProgressIndicator(),
            const SizedBox(
              width: 25.0,
            ),
            Expanded(
              child: Text(
                status,
                style: const TextStyle(fontSize: 16.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
