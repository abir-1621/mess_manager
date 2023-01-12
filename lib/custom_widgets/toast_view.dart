import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mess_manager/utils/globalcolors.dart';


showToast(BuildContext context,String message){
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(12),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: Colors.white,
        onPressed: () {
          //Do whatever you want
        },
      ),
    ),
  );
}




