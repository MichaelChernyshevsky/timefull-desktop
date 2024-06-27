import 'package:timefull/exports.dart';

class AppRoutes {
  final GoRouter router = GoRouter(
    // redirect: (context, state) => getIt<AuthService>().accessToken != '' ? '/main' : null,
    routes: <GoRoute>[
      // GoRoute(
      //   path: '/',
      //   name: 'Auth screen',
      //   builder: (BuildContext context, GoRouterState state) => const AuthScreen(),
      //   routes: [
      //     GoRoute(
      //       path: 'main',
      //       name: 'Main Screen',
      //       builder: (BuildContext context, GoRouterState state) => const MainScreen(),
      //       routes: [
      //         GoRoute(
      //           path: 'user',
      //           name: 'User',
      //           builder: (context, state) => UserScreen(userData: state.extra as UserData),
      //         ),
      //         // GoRoute(
      //         //   path: 'User',
      //         //   name: 'User',
      //         //   builder: (context, state) => const UserScreen(),
      //         // ),
      //       ],
      //     ),
      //   ],
      // ),
    ],
  );
}
