import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';
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
            const DrawerElement(
              title: 'packages',
              icon: Icons.manage_accounts,
              contentWidget: PackagesScreen(),
              content: Content.packages,
            ),
            if (state.content!.economy)
              const DrawerElement(
                title: 'economy',
                icon: Icons.person,
                contentWidget: EconomyScreen(),
                content: Content.economy,
              ),
            if (state.content!.task)
              const DrawerElement(
                title: 'task',
                icon: Icons.person,
                contentWidget: TaskScreen(),
                content: Content.task,
              ),
            if (state.content!.timer)
              const DrawerElement(
                title: 'timer',
                icon: Icons.person,
                contentWidget: TimerScreen(),
                content: Content.timer,
              ),
          ],
          outDrawers: [
            // DrawerElement(
            //   title: AppLocalizations.current.info,
            //   icon: Icons.info_outline,
            //   contentWidget: const InfoContent(),
            //   content: Content.info,
            // ),
            if (state.authed == true)
              const DrawerElement(
                title: 'user',
                icon: Icons.accessibility_outlined,
                contentWidget: null,
                content: Content.user,
              ),
            if (state.authed == false)
              const DrawerElement(
                title: 'sign in ',
                icon: Icons.person_off_outlined,
                contentWidget: null,
                content: Content.signin,
              ),
          ],
        );
      },
    );
  }
}
