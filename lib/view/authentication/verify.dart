import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:shop0koa_frontend/view/product/product.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

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
            Get.to(ProductPage());
          }
        ),
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
              child: Container(
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
              child: Container(
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
            Container(
              width: MediaQuery.of(context).size.width - 30,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFF34C759),
                ),
                child: const Text('Verify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
