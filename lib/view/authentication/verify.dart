import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop0koa_frontend/logic/pick_files.dart';
import 'package:shop0koa_frontend/main.dart';
import 'package:shop0koa_frontend/provider/authenticationProvider.dart';
import 'package:shop0koa_frontend/services/firebase.dart';
import 'package:shop0koa_frontend/view/authentication/Pendingpage.dart';
import 'package:shop0koa_frontend/view/screens/screens.dart';
import 'package:shop0koa_frontend/view/widgets/button.dart';
import 'package:shop0koa_frontend/view/widgets/dotted_border_container.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class VerifyBusiness extends StatefulWidget {
  static const routeName = 'verifyBusiness';
  const VerifyBusiness({super.key});

  @override
  State<VerifyBusiness> createState() => _VerifyBusinessState();
}

class _VerifyBusinessState extends State<VerifyBusiness> {
  String permitUrl = '';
  String kraUrl = '';
  String nationalIDUrl = '';
  bool permitUploadDone = false;
  bool kraUploadDone = false;
  bool nationalIDUploadDone = false;
  double permitUploadProgress = 0.0;
  double kraUploadProgress = 0.0;
  double nationalIDUploadProgress = 0.0;
  final Firebase firebase = Firebase();
  late AuthProvider authProvider;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authProvider = Provider.of<AuthProvider>(context);
  }

  Future<void> _uploadFile(String filePath, bool isPermit) async {
    final file = File(filePath);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('business-documents/${file.path.split('/').last}');
    final uploadTask = storageRef.putFile(file);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      setState(() {
        if (isPermit) {
          setState(() {
            permitUploadProgress = snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          });
        } else if (!isPermit) {
          setState(() {
            kraUploadProgress = snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          });
        } else {
          setState(() {
            nationalIDUploadProgress = snapshot.bytesTransferred.toDouble() /
                snapshot.totalBytes.toDouble();
          });
        }
      });
    }, onError: (e) {
      // Handle error
      print(e);
    });

    try {
      await uploadTask;
      String downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        if (isPermit) {
          permitUploadProgress = 0.0; // Reset progress after completion
          permitUrl = downloadUrl;
          permitUploadDone = true;
        } else if (!isPermit) {
          kraUploadProgress = 0.0; // Reset progress after completion
          kraUrl = downloadUrl;
          kraUploadDone = true;
        } else {
          nationalIDUploadProgress = 0.0; // Reset progress after completion
          nationalIDUrl = downloadUrl;
          nationalIDUploadDone = true;
        }
      });
      print('File uploaded successfully. Download URL: $downloadUrl');
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  Future<void> _pickAndUploadDocument(bool isPermit) async {
    final path = await PickFiles().pickDocuments();
    if (path != null) {
      await _uploadFile(path, isPermit);
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                      await _pickAndUploadDocument(true);
                    },
                    child: permitUploadDone
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 50,
                                color: Colors.green,
                              ),
                              Text('Done', style: TextStyle(fontSize: 18)),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.file_upload,
                                size: 50,
                              ),
                              permitUploadProgress > 0
                                  ? Column(
                                      children: [
                                        LinearProgressIndicator(
                                            value: permitUploadProgress),
                                        const SizedBox(height: 10),
                                        Text(
                                            '${(permitUploadProgress * 100).toStringAsFixed(2)}%'),
                                      ],
                                    )
                                  : const Text(
                                      'Upload Business Permit (PDF 2MB Max)'),
                            ],
                          ),
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
                      await _pickAndUploadDocument(false);
                    },
                    child: kraUploadDone
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 50,
                                color: Colors.green,
                              ),
                              Text('Done', style: TextStyle(fontSize: 18)),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.file_upload, size: 50),
                              kraUploadProgress > 0
                                  ? Column(
                                      children: [
                                        LinearProgressIndicator(
                                            value: kraUploadProgress),
                                        const SizedBox(height: 10),
                                        Text(
                                            '${(kraUploadProgress * 100).toStringAsFixed(2)}%'),
                                      ],
                                    )
                                  : const Text(
                                      'Upload KRA Document (PDF 2MB Max)'),
                            ],
                          ),
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
                      await _pickAndUploadDocument(false);
                    },
                    child: kraUploadDone
                        ? const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 50,
                                color: Colors.green,
                              ),
                              Text('Done', style: TextStyle(fontSize: 18)),
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.file_upload, size: 50),
                              kraUploadProgress > 0
                                  ? Column(
                                      children: [
                                        LinearProgressIndicator(
                                            value: kraUploadProgress),
                                        const SizedBox(height: 10),
                                        Text(
                                            '${(kraUploadProgress * 100).toStringAsFixed(2)}%'),
                                      ],
                                    )
                                  : const Text(
                                      'Upload National ID Document (PDF 2MB Max)'),
                            ],
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              authProvider.isLoading
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      child: CustomButton(
                        onTap: () async {
                          await authProvider.verifyBusines(
                            context: context,
                            kraUrl: kraUrl,
                            permitUrl: permitUrl,
                            natinalUrl: nationalIDUrl,
                            UserId: authProvider.user!.user!.id!,
                          );
                          navigatorKey.currentState!
                              .pushNamed(Pendingpage.routeName);
                        },
                        text: 'VERIFY',
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
