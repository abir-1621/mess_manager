import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../translations/locale_keys.g.dart';

class TextFromGlobal extends StatefulWidget {
  const TextFromGlobal(
      {Key? key,
        required this.controller,
        required this.hintText,
        required this.textInputType,
        required this.obscure})
      : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final bool obscure;

  @override
  State<TextFromGlobal> createState() => _TextFromGlobalState();
}

class _TextFromGlobalState extends State<TextFromGlobal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 7,
            )
          ]),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscure,
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(0),
          hintStyle:const TextStyle(
            height: 1,
          )
        ),
      ),
    );
  }
}
