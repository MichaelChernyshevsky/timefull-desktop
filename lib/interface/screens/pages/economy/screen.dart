import 'package:flutter/material.dart';

class EconomyScreen extends StatefulWidget {
  const EconomyScreen({super.key});

  @override
  State<EconomyScreen> createState() => _EconomyScreenState();
}

class _EconomyScreenState extends State<EconomyScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      color: Colors.white,
      child:
          //  Column(
          //     children: [
          //       for (final package in state.packages!.keys)
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceAround,
          //           children: [
          //             Text(package),
          //             GestureDetector(
          //               onTap: () => _userBloc.add(ChangePackage(type: package)),
          //               child: Text(state.packages![package]!),
          //             ),
          //           ],
          //         )
          //     ],
          //   )
          const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
