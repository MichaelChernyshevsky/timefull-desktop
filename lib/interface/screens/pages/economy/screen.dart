import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';
import 'package:timefull/interface/screens/pages/economy/add.dart';
import 'package:timefull/manager/packages/economy/bloc.dart';

class EconomyScreen extends StatefulWidget {
  const EconomyScreen({super.key});

  @override
  State<EconomyScreen> createState() => _EconomyScreenState();
}

class _EconomyScreenState extends State<EconomyScreen> {
  late EconomyBloc _economyBloc;

  @override
  void initState() {
    super.initState();
    _economyBloc = BlocProvider.of<EconomyBloc>(context);
    // _userBloc.add(RefreshPackages());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EconomyBloc, EconomyBlocState>(builder: (context, state) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.93,
        color: Colors.white,
        child: state.state == EconomyState.loaded
            ? Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _economyBloc.add(AddState()),
                        child: Text(
                          !state.showAddContent ? 'add' : 'list',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                  if (!state.showAddContent)
                    Column(
                      children: [
                        if (state.economy!.isNotEmpty)
                          for (final economy in state.economy!)
                            Row(
                              children: [
                                Text(economy.title),
                                Text(economy.income ? '+' : '-'),
                                Text(economy.count),
                              ],
                            ),
                        if (state.economy!.isEmpty) const Center(child: Text('empty'))
                      ],
                    )
                  else
                    const EconomyAddScreen()
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
