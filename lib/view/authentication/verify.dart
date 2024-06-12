import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/logic/pick_files.dart';
import 'package:shop0koa_frontend/main.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/services/firebase.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:shop0koa_frontend/view/widgets/dotted_border_container.dart';

class VerifyBusiness extends StatefulWidget {
  static const routeName = 'verifyBusiness';
  const VerifyBusiness({super.key});

  @override
  State<VerifyBusiness> createState() => _VerifyBusinessState();
}

class _VerifyBusinessState extends State<VerifyBusiness> {
  String permitUrl = '';
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Required*', style: TextStyle(fontSize: 14)),
            DottedBorderContainer(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 200,
                child: TextButton(
                  onPressed: () async {
                    var path = await PickFiles().pickDocuments();
                    await firebase.storeProduct(
                        selectedImageFile: XFile(path!));
                    debugPrint("The upload is finished");
                    setState(() {
                      permitUrl = path;
                    });
                  },
                  child: permitUrl.isEmpty
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
                      : Center(child: Text(permitUrl)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Required*', style: TextStyle(fontSize: 14)),
            DottedBorderContainer(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 30,
                height: 200,
                child: TextButton(
                  onPressed: () async {
                    var result = await PickFiles().pickDocuments();

                    await firebase.storeProduct(
                        selectedImageFile: XFile(result!));

                    setState(() {
                      kraUrl = result;
                    });
                  },
                  child: kraUrl.isEmpty
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.file_upload, size: 50),
                            Text('Upload xxxxxxxxxx (PDF 2MB Max)'),
                          ],
                        )
                      : Center(
                          child: Text(kraUrl),
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
                navigatorKey.currentState!.pushNamed(NavigationPage.routeName);
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
