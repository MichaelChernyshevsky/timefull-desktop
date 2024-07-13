import 'package:get_it/get_it.dart';
import 'package:timefull/manager/packages/economy/bloc.dart';
import 'package:timefull/manager/packages/note/bloc.dart';
import 'package:timefull/manager/packages/note/childBloc/bloc.dart';
import 'package:timefull/manager/packages/tasks/bloc.dart';
import 'package:timefull/manager/packages/timer/bloc.dart';
import 'package:timefullcore/service.dart';

import 'exports.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton<CoreService>(CoreService());

  await GetIt.I.get<CoreService>().initialize(shema: true);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(create: (context) => UserBloc()..add(Initialize())),
        // packages
        BlocProvider<EconomyBloc>(create: (context) => EconomyBloc()..add(RefreshEconomy())),
        BlocProvider<TaskBloc>(create: (context) => TaskBloc()..add(RefreshTasks())),
        BlocProvider<NoteBloc>(create: (context) => NoteBloc()..add(RefreshNotes())),
        BlocProvider<PageBloc>(create: (context) => PageBloc()),

        BlocProvider<TimerBloc>(create: (context) => TimerBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppLocalizations.current.appName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      routerConfig: AppRoutes().router,
    );
  }
}
