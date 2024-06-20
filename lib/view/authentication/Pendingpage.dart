import 'package:flutter/material.dart';

class Pendingpage extends StatelessWidget {
  static const routeName = 'PendingPage';

  const Pendingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(
              height: 40.0,
              child: Text(
                'Pending Approval',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 100.0,
              child: Text(
                'Thank you for submitting your application',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
