import 'package:flutter/material.dart';
import 'package:flutter_nested_navigation/files.dart';
import 'package:flutter_nested_navigation/home.dart';
import 'package:flutter_nested_navigation/settings.dart';
import 'package:go_router/go_router.dart';

import 'profile.dart';
import 'root.dart';

class NavRouter {
  static const routes = _Routes();

  static final rootNavKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    // initialLocation: "/",
    navigatorKey: rootNavKey,
    routes: [
      GoRoute(
        path: "/",
        redirect: (context, state) {
          return routes.home;
        },
      ),
      GoRoute(
        path: routes.settings,
        parentNavigatorKey: rootNavKey,
        builder: (context, state) => const SettingsPage(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MyHomePage(
            navigationShell: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: routes.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: routes.files,
                  builder: (context, state) => const FilesPage(),
                  routes: [
                    GoRoute(
                      path: ":folder",
                      name: "namedFolder",
                      builder: (context, state) {
                        return FilesPage(
                          pageNumber: int.tryParse(
                              state.pathParameters["folder"] ?? ""),
                        );
                      },
                    )
                  ]),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: routes.profile,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

class _Routes {
  const _Routes();
  final String home = "/home";
  final String files = "/files";
  final String profile = "/profile";
  final String settings = "/settings";
}
