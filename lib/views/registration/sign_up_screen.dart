import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mess_manager/custom_widgets/custom_textfield.dart';

import '../../utils/tools.dart';

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
  State<RectangleSingUpWidget> createState() => _RectangleSingUpWidgetState();
}

class _RectangleSingUpWidgetState extends State<RectangleSingUpWidget>
    with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  bool isReversed = false;

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
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: CustomTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: CustomTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: CustomTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0.h),
                      child: CustomTextField(
                        labelText: "Password",
                        hintText: "enter your password",
                      ),
                    ),
                    Container(
                      width: 80.sw,
                      margin: EdgeInsets.only(top: 16.0.h),
                      child: ElevatedButton(
                        // only enable the button if the text is not empty
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //todo:do something
                          }
                        },
                        child: const Text(
                          'Submit',
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
