import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/resources.dart';
import 'alerts.dart';

class Pickers {
  static Future<File?> pickImage(ImageSource imageSource) async {
    try {
      XFile? image = await ImagePicker().pickImage(source: imageSource);
      return image != null ? File(image.path) : null;
    } on PlatformException catch (_) {
      Alerts.showToast(AppStrings.msgUnknownError);
      return null;
    }
  }

  static Future<List<File>> pickMultiImages() async {
    try {
      final List<XFile> selectedImages = await ImagePicker().pickMultiImage();
      final List<File> images = [];
      for (var image in selectedImages) {
        images.add(File(image.path));
      }
      return images;
    } on PlatformException catch (_) {
      Alerts.showToast(AppStrings.msgUnknownError);
      return [];
    }
  }
}
