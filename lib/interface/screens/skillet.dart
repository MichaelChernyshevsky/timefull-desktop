import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';
import 'package:timefull/interface/routes/drawers.dart';
import 'package:timefull/interface/screens/pages/economy/screen.dart';
import 'package:timefull/interface/screens/pages/packages/screen.dart';
import 'package:timefull/interface/screens/pages/tasks/screen.dart';
import 'package:timefull/interface/screens/pages/timer/screen.dart';
import 'package:timefull/interface/screens/widgets/screen_helper.dart';
import 'package:timefull/manager/user/bloc.dart';

class Skillet extends StatefulWidget {
  const Skillet({super.key});

  @override
  State<Skillet> createState() => _SkilletState();
}

class _SkilletState extends State<Skillet> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (BuildContext context, UserBlocState state) {
        return ScreenHelper(
          title: '',
          drawers: [
            drawerPackages,
            drawerNote,
            if (state.content!.economy) drawerEconomy,
            if (state.content!.task) drawerTask,
            if (state.content!.timer) drawerTimer,
          ],
          outDrawers: [
            if (state.authed == true) drawerUser,
            if (state.authed == false) drawerSignIn,
          ],
        );
      },
    );
  }
}
