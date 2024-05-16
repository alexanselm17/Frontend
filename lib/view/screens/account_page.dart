import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('Account Page'),
          )
        ],
      ),
    );
  }
}
