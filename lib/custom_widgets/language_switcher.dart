import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../utils/globalcolors.dart';


class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({Key? key}) : super(key: key);

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  bool _isBan = false;

  @override
  Widget build(BuildContext context) {
    _isBan = context.locale.toString() == 'bn_BD';
    return SizedBox(
      width: 90.w,
      height: 30.h,
      child: FlutterSwitch(
        width: 60.w,
        // toggleColor: appSecondaryCol,
        showOnOff: true,
        activeText: "BN",
        inactiveText: "EN",
        activeTextColor: appPrimaryCol,
        inactiveTextColor: appPrimaryCol,
        activeToggleColor: Colors.black,
        activeColor: appPrimaryLightVariant,
        inactiveColor: Colors.black12,
        activeTextFontWeight: FontWeight.w500,
        inactiveTextFontWeight: FontWeight.normal,
        valueFontSize: 12,
        value: _isBan,
        onToggle: (isBangla) {
          setState(() {
            _isBan = isBangla;
          });

          if (isBangla) {
            context.setLocale(const Locale('bn', 'BD'));
          } else {
            context.setLocale(const Locale('en', 'US'));
          }
        },
      ),
    );
  }
}
