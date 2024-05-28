import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:shop0koa_frontend/constants/colors.dart';
import 'package:shop0koa_frontend/utils/button.dart';
import 'package:shop0koa_frontend/view/authentication/login_page.dart';
import 'package:shop0koa_frontend/view/authentication/new_pin.dart';
import 'package:shop0koa_frontend/view/screens/home_page.dart';

class VerifyBusiness extends StatelessWidget {
  static const routeName = 'verifyBusiness';
  const VerifyBusiness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Verify Business',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Required*', style: TextStyle(fontSize: 14)),
            DottedBorder(
              color: Colors.grey,
              strokeWidth: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 200,
                child: TextButton(
                  onPressed: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_upload,
                        size: 50,
                      ),
                      Text('Upload Business Permit (PDF 2MB Max)'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Required*', style: TextStyle(fontSize: 14)),
            DottedBorder(
              color: Colors.grey,
              strokeWidth: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 200,
                child: TextButton(
                  onPressed: () {},
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.file_upload, size: 50),
                      Text('Upload xxxxxxxxxx (PDF 2MB Max)'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              color: AppColors.mainColor,
              onTap: () {
                Navigator.of(context).pushNamed(NewPin.routeName);
                //Get.to(NewPin());
              },
              text: 'VERIFY',
            ),
          ],
        ),
      ),
    );
  }
}
