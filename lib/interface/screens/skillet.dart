import 'package:timefull/exports.dart';
import 'package:timefull/interface/routes/drawers.dart';
import 'package:timefull/interface/screens/widgets/screen_helper.dart';

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
