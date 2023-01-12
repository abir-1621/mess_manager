import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mess_manager/features/registration/screens/on_boarding/on_boarding_screen.dart';
import '../features/registration/screens/number_login.dart';
import '../features/registration/screens/otp.dart';
import '../features/registration/screens/sign_up_screen.dart';
import '../features/registration/screens/user_information_screen.dart';
import '../main.dart';
import '../views/home/details_screen.dart';
import '../views/home/home_screen.dart';


/// The route configuration.
final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
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
            return const OnBoardingScreen();
          },

        ),
      ],
    ),
  ],
);
