import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';
import '../views/home/details_screen.dart';
import '../views/home/home_screen.dart';

/// The route configuration.
final GoRouter routerConfig = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) {
            return const DetailsScreen();
          },
        ),
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const MyHomePage(title: "title");
          },
        )
      ],
    ),
  ],
);
