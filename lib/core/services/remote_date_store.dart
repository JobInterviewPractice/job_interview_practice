import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class RemoteDateStore {
  Future<String> uploadFile(String filePath, String userId) async {
    try {
      final dateString = DateTime.now().millisecondsSinceEpoch.toString();
      final url = 'uploads/$userId/$dateString';
      final task = await firebase_storage.FirebaseStorage.instance.ref(url).putFile(File(filePath));
      if (task.state == firebase_storage.TaskState.success) {
        String downloadURL = await firebase_storage.FirebaseStorage.instance
            .ref(url)
            .getDownloadURL();
        return downloadURL;
      }
      throw Exception('Server error');
    } on FirebaseException catch (_) {
      throw Exception('Server error');
    }
  }
}