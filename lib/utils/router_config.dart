import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mess_manager/utils/route_names_paths.dart';
import 'package:mess_manager/views/on_boarding/on_boarding_screen.dart';
import '../custom_widgets/bottom_navbar/bottom_nav_screen.dart';
import '../views/main.dart';
import '../views/home/details_screen.dart';
import '../views/home/home_screen.dart';
import '../views/registration/number_login.dart';
import '../views/registration/otp.dart';
import '../views/registration/sign_up_screen.dart';
import '../views/registration/user_information_screen.dart';
import '../views/spalsh/splash_screen.dart';


/// The route configuration.
final GoRouter routerConfig = GoRouter(
  initialLocation: AppRouter.splashScreenPath,
  routes: <RouteBase>[
    GoRoute(
      path: AppRouter.homeScreenPath,
      builder: (BuildContext context, GoRouterState state) {
        return const BottomNavScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          name: 'details',
          path: 'details/:id',
          builder: (BuildContext context, GoRouterState state) {
            print(state.params["id"]);
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: "title");
          },
        ),
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const UserLogin();
          },
        ),
        GoRoute(
          name: "sign_up",
          path: 'sign_up',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          name: "user_info",
          path: 'user_info',
          builder: (BuildContext context, GoRouterState state) {
            return const UserInfromationScreen();
          },
        ),
        GoRoute(
          name: "otp",
          path: 'otp/:verificationId',
          builder: (BuildContext context, GoRouterState state) {
            return Otp(verificationId: state.params['verificationId']??"");
          },

        ),
        GoRoute(
          name: "onBoarding",
          path: 'onBoarding',
          builder: (BuildContext context, GoRouterState state) {
            return OnBoardingScreen();
          },

        ),
      ],

    ),
    GoRoute(
      path: AppRouter.splashScreenPath,
      builder: (context, state) => const SplashScreen(),
    )
  ],
);
