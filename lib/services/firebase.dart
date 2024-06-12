import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class Firebase {
  Future storeProduct({required XFile selectedImageFile}) async {
    final firebase_storage.FirebaseStorage firebaseStorage =
        firebase_storage.FirebaseStorage.instance;

    firebase_storage.Reference reference =
        firebaseStorage.ref().child('product-images');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': selectedImageFile.path});

    if (kIsWeb) {
      await reference.putData(await selectedImageFile.readAsBytes(), metadata);
      return await reference.getDownloadURL();
    } else {
      await reference
          .child(selectedImageFile.name)
          .putFile(File(selectedImageFile.path), metadata);
      return await reference.getDownloadURL();
    }
  }
}
