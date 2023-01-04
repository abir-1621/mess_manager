import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mess_manager/utils/globalcolors.dart';

import '../../custom_widgets/text_field.dart';
import '../../translations/locale_keys.g.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController numberController = TextEditingController();
  TextEditingController passWord = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Logo',
                  style: TextStyle(
                      color: GlobalColors.tittleText,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Login to your account',
                style: TextStyle(
                  color: GlobalColors.tittleText,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 50),
              TextFromGlobal(
                controller: numberController,
                hintText: LocaleKeys.number.tr(),
                textInputType: TextInputType.number,
                obscure: false,
              ),
              const SizedBox(height: 15),
              TextFromGlobal(
                controller: passWord,
                hintText: 'Password',
                textInputType: TextInputType.text,
                obscure: true,
              ),
          FloatingActionButton(
            // When the user presses the button, show an alert dialog containing
            // the text that the user has entered into the text field.
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text that the user has entered by using the
                    // TextEditingController.
                    content: Text(numberController.text),
                  );
                },
              );
            },
            tooltip: 'Show me the value!',
            child: const Icon(Icons.text_fields)),
            ],
          ),
        )),
      ),
    );
  }
}
