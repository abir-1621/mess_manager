import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_manager/custom_widgets/custom_textfield.dart';
import 'package:mess_manager/custom_widgets/otp_textfield.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../utils/tools.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
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
  State<RectangleSingUpWidget> createState() => RectangleSingUpWidgetState();
}

class RectangleSingUpWidgetState extends State<RectangleSingUpWidget>
    with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  final _otpKey = GlobalKey<OtpTextFieldsState>();
  bool isReversed = false, passwordV = false;

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();

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
    WidgetsBinding.instance?.removeObserver(this);
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
    // print(Provider.of<AuthProvider>(context,listen: false).isOtpVisible);
    // print(context.watch<AuthProvider>().counter.toString());
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
                        controller: _numberController,
                        labelText: "Phone number",
                        hintText: "+88017XXXXXXXXX",
                        textInputType: TextInputType.number,
                      ),
                    ),
                    Visibility(
                      visible: passwordV,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0.h),
                        child: CustomTextField(
                          controller: _passwordController,
                          labelText: "Password",
                          hintText: "enter your password",
                          obscure: true,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: passwordV,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 10.0.h),
                        child: CustomTextField(
                          controller: _cPasswordController,
                          labelText: "Confirm password",
                          hintText: "confirm your password",
                          obscure: true,
                        ),
                      ),
                    ),
                     Visibility(
                        // visible: Provider.of<AuthProvider>(context,listen: true  ).counter,
                        child: Container(
                          margin:  EdgeInsets.symmetric(horizontal: 50.w,vertical: 50.h),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 4,
                            pastedTextStyle: TextStyle(
                              color: Colors.green.shade600,
                              fontWeight: FontWeight.bold,
                            ),
                            animationType: AnimationType.fade,
                            onChanged: (String value) {

                            },
                            // validator: (v) {
                            //   if (v!.length < 3) {
                            //     return "I'm from validator";
                            //   } else {
                            //     return null;
                            //   }
                            // },
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

                              });
                              debugPrint("Completed$v");
                            },
                          ),
                        ),
                    ),
                    // Text(context.watch<AuthProvider>().counter.toString()),

                    Container(
                      width: 80.sw,
                      margin: EdgeInsets.only(top: 20.0.h),
                      child: ElevatedButton(
                        // only enable the button if the text is not empty
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //todo:do something
                            String number =_numberController.text.trim();
                           // AuthProvider().signInWithNumber( number: '+88$number',context: context);

                            // setState(() {
                            //   passwordV = true;
                            // });
                            // if (_passwordController.text !=
                            //     _cPasswordController.text) {
                            //   Toast().showToast(context, "Password mismatched.");
                            //   return;
                            // }
                            // print(_cPasswordController.text.toString());
                            // print(_numberController.text.toString());
                            // print(_passwordController.text.toString());
                          }
                        },
                        child: const Text(
                          'Send OTP',
                        ),
                      ),
                    ),
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
