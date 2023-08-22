import 'package:go_router/go_router.dart';

import 'home.dart';

class NavRouter {
  static const routes = _Routes();
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        redirect: (context, state) {
          context.go(routes.home);
          return null;
        },
      ),
      GoRoute(
        path: routes.home,
        builder: (context, state) {
          return const MyHomePage(title: "title");
        },
      ),
    ],
  );
}

class _Routes {
  const _Routes();
  final String home = "/home";
}
