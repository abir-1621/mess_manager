import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_manager/utils/globalcolors.dart';

class CustomTextField extends StatefulWidget {
  String labelText = "";
  String hintText = "";

  CustomTextField({Key? key, this.labelText = "", this.hintText = ""})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? "can't be empty" : null,
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 8.0.w),
        isDense: true,
        label: Text(
          widget.labelText,
          style: GoogleFonts.roboto(),
        ),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        hintStyle: GoogleFonts.roboto(),
      ),
    );
  }
}
