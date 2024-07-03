import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefullcore/packages/packages/model.dart';
import 'package:timefullcore/service.dart';

class PackagesScreen extends StatefulWidget {
  const PackagesScreen({super.key});

  @override
  State<PackagesScreen> createState() => _PackagesScreenState();
}

class _PackagesScreenState extends State<PackagesScreen> {
  late UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _userBloc.add(RefreshPackages());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserBlocState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.93,
          color: Colors.white,
          child: state.statePackages == PackagesStateBloc.loaded
              ? Column(
                  children: [
                    for (final package in state.packages!.keys)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(package),
                          GestureDetector(
                            onTap: () => _userBloc.add(ChangePackage(type: package)),
                            child: Text(state.packages![package]!),
                          ),
                        ],
                      )
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
