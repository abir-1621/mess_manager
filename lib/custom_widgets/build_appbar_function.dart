import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar(
    {required BuildContext context,
    required String title,
    Widget? appbarActionWidget}) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, size: 16.h),
      onPressed: () => Navigator.of(context).pop(),
    ),
    title: Text(
      title,
    ),
    actions: [
      appbarActionWidget ?? const SizedBox(),
    ],
  );
}
