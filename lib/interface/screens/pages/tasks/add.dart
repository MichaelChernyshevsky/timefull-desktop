import 'package:flutter/material.dart';
import 'package:timefull/exports.dart';
import 'package:timefull/manager/packages/tasks/bloc.dart';
import 'package:timefullcore/packages/tasks/model.dart';

class TaskAddScreen extends StatefulWidget {
  const TaskAddScreen({super.key});

  @override
  State<TaskAddScreen> createState() => _TaskAddScreenState();
}

class _TaskAddScreenState extends State<TaskAddScreen> {
  late TextEditingController title;
  late TextEditingController description;
  late TextEditingController countOnDay;
  late TextEditingController countOnTask;
  bool income = true;
  bool showButton = false;
  late TaskBloc _taskBloc;

  @override
  void initState() {
    _taskBloc = BlocProvider.of<TaskBloc>(context);
    title = TextEditingController();
    description = TextEditingController();
    countOnDay = TextEditingController();
    countOnTask = TextEditingController();

    title.addListener(() {
      if (title.text.isNotEmpty) {
        setState(() => showButton = true);
      } else {
        setState(() => showButton = false);
      }
    });

    super.initState();
  }

  void add() => _taskBloc.add(
        AddTask(
          model: TaskModel(
            id: 0,
            countOnDay: int.parse(countOnDay.text),
            countOnTask: int.parse(countOnTask.text),
            date: DateTime.now().millisecondsSinceEpoch.toString(),
            description: description.text,
            title: title.text,
            userId: '',
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('title'),
        TextFormField(controller: title),
        const Text('description'),
        TextFormField(controller: description),
        const Text('countOnDay'),
        TextFormField(controller: countOnDay),
        const Text('countOnTask'),
        TextFormField(controller: countOnTask),
        if (showButton)
          GestureDetector(
            onDoubleTap: add,
            child: const Text('add'),
          )
      ],
    );
  }
}
