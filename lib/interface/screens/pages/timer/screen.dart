import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:timefull/exports.dart';
import 'package:timefull/interface/screens/pages/timer/widgets/screen.dart';
import 'package:timefull/manager/packages/timer/bloc.dart';
import 'package:timefullcore/core.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late TimerBloc _timerBloc;
  @override
  void initState() {
    super.initState();
    _timerBloc = BlocProvider.of<TimerBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return BlocBuilder<TimerBloc, TimerBlocState>(
      builder: (context, state) {
        return Container(
          width: MediaQuery.of(context).size.width * 0.93,
          color: Colors.white,
          child: state.state == TimerStateBloc.loaded
              ? Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(h * 0.02),
                      child: Column(
                        children: [
                          Text(
                            state.model!.title,
                            style: TextStyle(fontSize: h * 0.05),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'work',
                                style: TextStyle(fontSize: h * 0.03),
                              ),
                              // work
                              Padding(
                                padding: EdgeInsets.only(top: h * 0.06),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    RoundedButton(
                                      isPlus: false,
                                      size: h * 0.08,
                                      color: Colors.purple,
                                      tap: () => _timerBloc.add(ChangeTimer(isWork: true, isIncrease: false)),
                                    ),
                                    Text(state.model!.timeWork.toString()),
                                    RoundedButton(
                                      color: Colors.purple,
                                      isPlus: true,
                                      size: h * 0.08,
                                      tap: () => _timerBloc.add(ChangeTimer(isWork: true, isIncrease: true)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Text(
                                'relax',
                                style: TextStyle(fontSize: h * 0.03),
                              ),
                              // work
                              Padding(
                                padding: EdgeInsets.only(top: h * 0.06),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    RoundedButton(
                                      color: Colors.purple,
                                      isPlus: false,
                                      size: h * 0.08,
                                      tap: () => _timerBloc.add(ChangeTimer(isWork: false, isIncrease: false)),
                                    ),
                                    Text(state.model!.timeRelax.toString()),
                                    RoundedButton(
                                      color: Colors.purple,
                                      isPlus: true,
                                      size: h * 0.08,
                                      tap: () => _timerBloc.add(ChangeTimer(isWork: false, isIncrease: true)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: h * 0.03),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TimeButton(
                            onTap: () => _timerBloc.add(ChangeTimer(form: 1)),
                            text: 'm30m10',
                          ),
                          TimeButton(
                            onTap: () => _timerBloc.add(ChangeTimer(form: 2)),
                            text: 'm20m5',
                          ),
                          TimeButton(
                            onTap: () => _timerBloc.add(ChangeTimer(form: 3)),
                            text: 'm10m2',
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        StartOrStop(
                          isStart: !GetIt.I.get<CoreService>().timerRepo.stateIsWork,
                          onTap: () => _timerBloc.add(ActionTimer()),
                        ),
                      ],
                    ),
                  ],
                )
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
