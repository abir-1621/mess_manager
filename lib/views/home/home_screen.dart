import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/theme/theme_manager.dart';
import 'package:mess_manager/translations/locale_keys.g.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (isDark) {
              context.read<ThemeManager>().toggleTheme(isDark);
              setState(() {
                isDarkMode = !isDarkMode;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(LocaleKeys.homepage_body_txt).tr(),
            ElevatedButton(
              onPressed: () {
                context.go('/details');
              },
              child: const Text("Go to Details"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          changeLanguage(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void changeLanguage(BuildContext context) {
    if (context.locale == const Locale('bn', 'BD')) {
      context.setLocale(
        const Locale('en', 'US'),
      );
    } else {
      context.setLocale(
        const Locale('bn', 'BD'),
      );
    }
  }
}
