import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/logic/pick_files.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/services/firebase.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';

class VerifyBusiness extends StatefulWidget {
  static const routeName = 'verifyBusiness';
  const VerifyBusiness({super.key});

  @override
  State<VerifyBusiness> createState() => _VerifyBusinessState();
}

class _VerifyBusinessState extends State<VerifyBusiness> {
  String? pickedDocument;
  String permitUrl = '';
  String nationalUrl = '';
  String kraUrl = '';
  final Firebase firebase = Firebase();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
                  onPressed: () async {
                    var path = await PickFiles().pickDocuments();
                    var url = await firebase.storeProduct(
                        selectedImageFile: XFile(path!));
                    setState(() {
                      permitUrl = url;
                    });
                  },
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
                  onPressed: () async {
                    var result = await PickFiles().pickDocuments();
                    var path = await PickFiles().pickDocuments();
                    var url = await firebase.storeProduct(
                        selectedImageFile: XFile(path!));

                    setState(() {
                      kraUrl = kraUrl;
                      pickedDocument = result!;
                    });
                  },
                  child: pickedDocument == null
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload, size: 50),
                            Text('Upload xxxxxxxxxx (PDF 2MB Max)'),
                          ],
                        )
                      : Center(
                          child: Text(pickedDocument!),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            CustomButton(
              // color: AppColors.mainColor,
              onTap: () async {
                await authProvider.verifyBusines(
                  context: context,
                  kraUrl: kraUrl,
                  permitUrl: permitUrl,
                  natinalUrl: 'natinalUrl',
                  UserId: 1,
                );
                Navigator.of(context).pushNamed(NavigationPage.routeName);
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
