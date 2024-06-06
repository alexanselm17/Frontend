import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:shop0koa_frontend/logic/pick_files.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:shop0koa_frontend/view/authentication/new_pin.dart';

enum documentType { businesspermit, idCard }

class VerifyBusiness extends StatefulWidget {
  static const routeName = 'verifyBusiness';
  const VerifyBusiness({super.key});

  @override
  State<VerifyBusiness> createState() => _VerifyBusinessState();
}

class _VerifyBusinessState extends State<VerifyBusiness> {
  String? businessPermit;
  String? idCard;

  Future<void> pickDocuments(documentType type) async {
    var result = await PickFiles().pickDocuments();
    if (result != null) {
      setState(() {
        type == documentType.businesspermit
            ? businessPermit = result
            : idCard = result;
      });
    }
  }

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
                  onPressed: () {
                    pickDocuments(documentType.businesspermit);
                  },
                  child: businessPermit == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.file_upload,
                              size: 50,
                            ),
                            Text('Upload Business Permit (PDF 2MB Max)'),
                          ],
                        )
                      : Center(
                          child: Text(businessPermit!),
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
                  onPressed: () {
                    pickDocuments(documentType.idCard);
                  },
                  child: idCard == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload, size: 50),
                            Text('Upload Document (PDF 2MB Max)'),
                          ],
                        )
                      : Center(
                          child: Text(idCard!),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              // color: AppColors.mainColor,
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
