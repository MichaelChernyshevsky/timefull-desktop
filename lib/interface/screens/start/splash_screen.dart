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
        Future.delayed(const Duration(seconds: 3), () {
          context.go(state.authed ? '/skillet' : '/login');
        });
        return const Center(
          child: Text('splash scrrem'),
        );
      }),
    );
  }
}
