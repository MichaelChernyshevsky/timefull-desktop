import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';
import 'package:timefull/manager/packages/economy/bloc.dart';

class EconomyAddScreen extends StatefulWidget {
  const EconomyAddScreen({super.key});

  @override
  State<EconomyAddScreen> createState() => _EconomyAddScreenState();
}

class _EconomyAddScreenState extends State<EconomyAddScreen> {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController count;
  late TextEditingController date;
  bool income = true;
  bool showButton = false;
  late EconomyBloc _economyBloc;

  @override
  void initState() {
    _economyBloc = BlocProvider.of<EconomyBloc>(context);
    title = TextEditingController();
    description = TextEditingController();
    count = TextEditingController();
    date = TextEditingController();

    title.addListener(() {
      if (title.text.isNotEmpty && count.text.isNotEmpty) {
        setState(() => showButton = true);
      } else {
        setState(() => showButton = false);
      }
    });

    count.addListener(() {
      final RegExp regex = RegExp(r'^[0-9]*$');
      if (count.text.isNotEmpty && regex.hasMatch(count.text)) {
        if (count.text.isNotEmpty && title.text.isNotEmpty) {
          setState(() => showButton = true);
        }
      } else {
        setState(() => showButton = false);
      }
    });

    super.initState();
  }

  void add() => _economyBloc.add(
        AddEconomy(
          title: title.text,
          description: description.text,
          count: int.parse(count.text.toString()),
          date: int.parse(date.text.toString()),
          income: income,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(controller: title),
        TextFormField(controller: description),
        TextFormField(controller: count),
        TextFormField(controller: date),
        GestureDetector(
          onDoubleTap: () => setState(() {
            income = !income;
            print(income);
          }),
          child: Text(income ? 'income' : 'spending'),
        ),
        if (showButton)
          GestureDetector(
            onDoubleTap: add,
            child: const Text('add'),
          )
      ],
    );
  }
}
