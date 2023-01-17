import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedIconBtn extends StatelessWidget {
  final Function()? onPressed;
  final String btnText;
  final Color color;
  final IconData iconData;

  const CustomOutlinedIconBtn(
      {Key? key,
      required this.iconData,
      required this.onPressed,
      required this.btnText,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: Icon(
        iconData,
        size: 15,
      ),
      label: Text(btnText),
      onPressed: () {
        // Perform action
      },
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 5),
        minimumSize: Size(0, 0),
        foregroundColor: color,
        side: BorderSide(
          color: color,
          width: 0.9,
          style: BorderStyle.solid,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
