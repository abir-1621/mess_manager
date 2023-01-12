import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_manager/utils/globalcolors.dart';

import '../../../custom_widgets/custom_textfield.dart';
import '../../../custom_widgets/text_field.dart';
import '../../../translations/locale_keys.g.dart';
import '../../../utils/tools.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1672710017746-81c544e6cf46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  ),
                ),
              ),
            ),
            RectangleSingUpWidget(),
          ],
        ),
      ),
    );
  }
}

class RectangleSingUpWidget extends StatefulWidget {
  RectangleSingUpWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<RectangleSingUpWidget> createState() => _RectangleSingUpWidgetState();
}

class _RectangleSingUpWidgetState extends State<RectangleSingUpWidget>
    with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  bool isReversed = false;
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    // stop Observing the window size changes.
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
    _numberController.dispose();
    _passwordController.dispose();
  }

  @override
  void didChangeMetrics() {
    // When the window insets changes, the method will be called by the system, where we can judge whether the keyboard is hidden.
    keyboardHidden.then((value) => value
        ? setState(() {
      isReversed =
      true; //on hide keyboard scroll element will go to its original position
    })
        : null);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: isReversed,
      child: Container(
        margin: EdgeInsets.only(top: 180.h),
        width: 375.w,
        height: 700.h,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100.0),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.h),
              child: Text(
                "Create a new \n   Account",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.sp,
                ),
              ),
            ),
            Container(
              width: 320.w,
              margin: EdgeInsets.only(top: 50.0.h),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: CustomTextField(
                        labelText: "Phone",
                        hintText: "+88017XXXXXXXXX",
                        textInputType: TextInputType.number,
                        controller: _numberController,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: CustomTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                        obscure: true,
                        controller: _passwordController,
                      ),
                    ),
                    Container(
                      width: 80.sw,
                      margin: EdgeInsets.only(top: 16.0.h),
                      child: ElevatedButton(
                        // only enable the button if the text is not empty
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //todo:do something
                            print('${_numberController.text}@gmail.com');
                            try {
                              final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: 'abir@gmail.com',
                                  password: '#12345678#'
                              );
                              print(credential.user?.uid);
                            } on FirebaseAuthException catch (e) {
                              print(e.message);
                              if (e.code == 'user-not-found') {
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                print('Wrong password provided for that user.');
                              }
                            }

                          }
                        },
                        child: const Text(
                          'Submit',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0.h),
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Sign up',
                                style: GoogleFonts.roboto(color:GlobalColors.primary,fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => context.pushReplacement('/sign_up')),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}