import 'package:timefull/exports.dart';
import 'package:timefull/interface/screens/pages/economy/screen.dart';
import 'package:timefull/interface/screens/pages/note/screen.dart';
import 'package:timefull/interface/screens/pages/packages/screen.dart';
import 'package:timefull/interface/screens/pages/tasks/screen.dart';
import 'package:timefull/interface/screens/pages/timer/screen.dart';
import 'package:timefull/interface/screens/widgets/screen_helper.dart';

DrawerElement get drawerTask => const DrawerElement(
      title: 'task',
      icon: Icons.person,
      contentWidget: TaskScreen(),
      content: Content.task,
    );
DrawerElement get drawerPackages => const DrawerElement(
      title: 'packages',
      icon: Icons.manage_accounts,
      contentWidget: PackagesScreen(),
      content: Content.packages,
    );
DrawerElement get drawerEconomy => const DrawerElement(
      title: 'economy',
      icon: Icons.person,
      contentWidget: EconomyScreen(),
      content: Content.economy,
    );
DrawerElement get drawerTimer => const DrawerElement(
      title: 'timer',
      icon: Icons.person,
      contentWidget: TimerScreen(),
      content: Content.timer,
    );

DrawerElement get drawerUser => const DrawerElement(
      title: 'user',
      icon: Icons.accessibility_outlined,
      contentWidget: null,
      content: Content.user,
    );

DrawerElement get drawerSignIn => const DrawerElement(
      title: 'sign in ',
      icon: Icons.person_off_outlined,
      contentWidget: null,
      content: Content.signin,
    );

DrawerElement get drawerNote => const DrawerElement(
      title: 'note',
      icon: Icons.note,
      contentWidget: NoteScreen(),
      content: Content.note,
    );
