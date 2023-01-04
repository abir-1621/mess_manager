import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:mess_manager/views/registration/login.dart';

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
            return const Login();
          },
        ),
      ],
    ),
  ],
);
