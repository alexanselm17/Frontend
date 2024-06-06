import 'package:file_picker/file_picker.dart';

class PickFiles {
  Future<String?> pickImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      //allowedExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files.single.path;
    } else {
      return null;
    }
  }

  Future<String?> pickDocuments() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['docx', 'pdf'], type: FileType.custom);
    if (result != null && result.files.isNotEmpty) {
      return result.files.single.name;
    } else {
      return null;
    }
  }
}
