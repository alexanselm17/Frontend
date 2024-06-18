import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileUploadProvider with ChangeNotifier {
  double _uploadProgress = 0.0;
  double get uploadProgress => _uploadProgress;

  Future<String> uploadFile(File file) async {
    final storageRef = FirebaseStorage.instance
        .ref()
        .child('profiles/${file.path.split('/').last}');
    final uploadTask = storageRef.putFile(file);

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      _uploadProgress =
          snapshot.bytesTransferred.toDouble() / snapshot.totalBytes.toDouble();
      notifyListeners();
    }, onError: (e) {
      // Handle error
      print(e);
    });

    try {
      await uploadTask;
      String downloadUrl = await storageRef.getDownloadURL();
      _uploadProgress = 0.0;
      notifyListeners();
      return downloadUrl;
    } catch (e) {
      // Handle error
      print(e);
      rethrow;
    }
  }
}
