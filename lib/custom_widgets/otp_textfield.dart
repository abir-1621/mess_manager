import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpTextFields extends StatefulWidget {
  const OtpTextFields({Key? key}) : super(key: key);

  @override
  State<OtpTextFields> createState() => OtpTextFieldsState();
}

class OtpTextFieldsState extends State<OtpTextFields> {
  late String otpCode;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      pastedTextStyle: TextStyle(
        color: Colors.green.shade600,
        fontWeight: FontWeight.bold,
      ),
      animationType: AnimationType.fade,
      onChanged: (String value) {

      },
      validator: (v) {
        if (v!.length < 3) {
          return "I'm from validator";
        } else {
          return null;
        }
      },
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        activeFillColor: Colors.white,
      ),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: Colors.black12,
          blurRadius: 10,
        )
      ],
      onCompleted: (v) {
        setState(() {
          otpCode=v;
        });
        debugPrint("Completed$v");
      },
    );
  }
}
