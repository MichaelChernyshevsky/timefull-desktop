import 'package:timefull/exports.dart';

import 'package:timefull/interface/screens/start/splash_screen.dart';
import 'package:timefull/interface/screens/start/login_screen.dart';
import 'package:timefull/interface/screens/skillet.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
    // redirect: (context, state) => getIt<AuthService>().accessToken != '' ? '/main' : null,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => const SplashScreen(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
            routes: [
              GoRoute(
                path: 'skillet',
                builder: (context, state) => const Skillet(),
              )
            ],
          ),
        ],
      ),
    ],
  );
}
