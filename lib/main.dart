import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mess_manager/res/localization/localization_value.dart';
import 'package:mess_manager/res/theme/theme_manager.dart';
import 'package:mess_manager/res/theme/theme_type.dart';

import 'package:mess_manager/utils/router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationProvider().supportedLang,
      path: "assets/translations",
      saveLocale: true,
      fallbackLocale: const Locale('en', 'US'),
      useFallbackTranslations: true,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeManager(),
          ),
          ChangeNotifierProvider(
            create: (context) => LocalizationProvider(),
          )
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeManager>().themeMode,
      routerConfig: routerConfig,
    );
  }
}
