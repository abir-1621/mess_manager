import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mess_manager/services/auth_provider.dart';
import 'package:mess_manager/theme/theme_provider.dart';
import 'package:mess_manager/theme/theme_type.dart';
import 'package:mess_manager/utils/router_config.dart';
import 'package:provider/provider.dart';
import '../localization/localization_value.dart';
import '../services/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs.init();
  // Ideal time to initialize
  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
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
            create: (context) => AuthProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LocalizationProvider(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          builder: (BuildContext context, Widget? child) {
            return const MyApp();
          },
        ),
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
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: context.watch<ThemeProvider>().themeMode,
      routerConfig: routerConfig,
    );
  }
}


