import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mess_manager/utils/globalcolors.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              Column(
                children: const [
                  Text(
                    'Login to your account',
                    style: TextStyle(
                      color: GlobalColors.tittleText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
