import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  late UserBloc _userBloc;
  bool emailButton = false;
  bool passwordButton = false;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    email.addListener(() {
      if (email.text.isNotEmpty) {
        setState(() => emailButton = true);
      } else {
        setState(() => emailButton = false);
      }
    });
    password.addListener(() {
      if (password.text.isNotEmpty) {
        setState(() => passwordButton = true);
      } else {
        setState(() => passwordButton = false);
      }
    });
  }

  void listener(BuildContext context, UserBlocState state) {
    print(state);
    state.authed ? context.go('/skillet') : null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserBlocState>(
      listener: listener,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(controller: email),
            TextFormField(controller: password),
            if (passwordButton && emailButton)
              GestureDetector(
                onTap: () => _userBloc.add(SignIn(email: email.text, password: password.text)),
                child: const Text('Sign in'),
              )
          ],
        ),
      ),
    );
  }
}
