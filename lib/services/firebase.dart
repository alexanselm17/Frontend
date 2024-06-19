import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class Firebase {
  Future storeProduct({
    required XFile selectedImageFile,
  }) async {
    final firebase_storage.FirebaseStorage firebaseStorage =
        firebase_storage.FirebaseStorage.instance;
    String newImageFilename = '${const Uuid().v4()}.jpg';

    firebase_storage.Reference reference = firebaseStorage
        .ref()
        .child(const Uuid().v4())
        .child('product-images')
        .child(newImageFilename);

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': selectedImageFile.path});

    if (kIsWeb) {
      await reference.putData(await selectedImageFile.readAsBytes(), metadata);
      return await reference.getDownloadURL();
    } else {
      await reference.putFile(File(selectedImageFile.path), metadata);
      return await reference.getDownloadURL();
    }
  }
}
