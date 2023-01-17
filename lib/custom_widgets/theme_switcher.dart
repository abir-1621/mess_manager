import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provider.dart';
import '../utils/globalcolors.dart';


class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    _isDark = context.watch<ThemeProvider>().themeMode == ThemeMode.dark
        ? true
        : false;

    return SizedBox(
      width: 90.w,
      height: 30.h,
      child: FlutterSwitch(
        width: 60.w,
        // toggleColor: appSecondaryCol,
        showOnOff: true,
        activeText: "Dark",
        inactiveText: "Light",
        activeTextColor: appPrimaryCol,
        inactiveTextColor: appPrimaryCol,
        activeToggleColor: Colors.black,
        activeColor: appSecondaryCol,
        inactiveColor: Colors.black12,
        activeTextFontWeight: FontWeight.w500,
        inactiveTextFontWeight: FontWeight.normal,
        valueFontSize: 12,

        activeIcon: const Icon(
          Icons.dark_mode,
          color: Colors.white,
        ),
        inactiveIcon: const Icon(Icons.light_mode),
        value: _isDark,
        onToggle: (isDarkTheme) {
          context.read<ThemeProvider>().toggleTheme(isDarkTheme);
          setState(() {
            _isDark = isDarkTheme;
          });
        },
      ),
    );
  }
}
