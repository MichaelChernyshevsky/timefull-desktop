import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timefull/interface/screens/pages/tasks/add.dart';
import 'package:timefull/manager/packages/tasks/bloc.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TaskBloc _taskBloc;

  @override
  void initState() {
    super.initState();
    _taskBloc = BlocProvider.of<TaskBloc>(context)..add(RefreshTasks());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskBlocState>(builder: (context, state) {
      return Container(
        width: MediaQuery.of(context).size.width * 0.93,
        color: Colors.white,
        child: state.state == TaskStateBloc.loaded
            ? Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => _taskBloc.add(AddState()),
                        child: Text(
                          !state.showAddContent ? 'add' : 'list',
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                      const Spacer(),
                      if (state.tasks!.tasks.isNotEmpty)
                        GestureDetector(
                          onTap: () => _taskBloc.add(WipeTasks()),
                          child: const Text(
                            'wipe',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  ),
                  if (!state.showAddContent)
                    Column(
                      children: [
                        if (state.tasks!.tasks.isNotEmpty)
                          for (final task in state.tasks!.tasks)
                            Row(
                              children: [
                                Text(task.title),
                                Text(task.description),
                              ],
                            ),
                        if (state.tasks!.tasks.isEmpty) const Center(child: Text('empty'))
                      ],
                    )
                  else
                    const TaskAddScreen()
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      );
    });
  }
}
