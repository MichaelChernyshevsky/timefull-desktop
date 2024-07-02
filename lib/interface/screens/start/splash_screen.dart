import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserBlocState>(builder: (context, state) {
        Future.delayed(const Duration(seconds: 1), () {
          if (state.authed == null) {
            context.go('/login');
          } else {
            context.go('/login/skillet');
          }
        });
        return const Center(
          child: Text('splash scrrem'),
        );
      }),
    );
  }
}
