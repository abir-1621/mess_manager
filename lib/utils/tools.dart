import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import '../custom_widgets/toast_view.dart';

/// Determine whether the keyboard is hidden.
Future<bool> get keyboardHidden async {
  // If the embedded value at the bottom of the window is not greater than 0, the keyboard is not displayed.
  final check =
      () => (WidgetsBinding.instance?.window.viewInsets.bottom ?? 0) <= 0;
  // If the keyboard is displayed, return the result directly.
  if (!check()) return false;
  // If the keyboard is hidden, in order to cope with the misjudgment caused by the keyboard display/hidden animation process, wait for 0.1 seconds and then check again and return the result.
  return await Future.delayed(Duration(milliseconds: 100), () => check());
}

Future<File?> pickImage(BuildContext context) async {
  File? image;
  try {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showToast(context, e.toString());
  }

  return image;
}
