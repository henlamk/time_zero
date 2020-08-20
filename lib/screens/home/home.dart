import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:time_zero/models/app_state_model.dart';
import 'package:time_zero/models/timer_model.dart';
import 'package:time_zero/redux/actions/timer_actions.dart';
import 'package:time_zero/screens/home/_widgets/lower_clip.dart';
import 'package:time_zero/screens/home/_widgets/upper_clip.dart';
import 'package:time_zero/util/colors.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Home extends StatefulWidget {
  final DevToolsStore<AppState> store;

  Home({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: !widget.store.state.timer.isRunning
                    ? model.onStart
                    : model.onFinish,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  child: widget.store.state.timer.isRunning
                      ? Icon(Icons.pause, size: 75)
                      : Icon(Icons.play_arrow, size: 75),
                  color: CustomColors.success,
                ),
              ),
              SizedBox(height: 24),
              Text(
                widget.store.state.timer.start != null
                    ? DateFormat('HH:mm').format(widget.store.state.timer.start)
                    : '00:00',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.store.state.timer.start != null
                    ? widget.store.state.timer.passed
                    : '0000',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.store.state.timer.end != null
                    ? DateFormat('hh:mm').format(widget.store.state.timer.end)
                    : '00:00',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              // widget.store.state.timer.isRunning
              //     ?
              InkWell(
                onTap: model.onRequestTime,
                child: Container(
                  child: Icon(Icons.update, size: 75),
                  height: 200,
                  width: double.infinity,
                  color: CustomColors.success,
                ),
              )
              // : Container()
            ],
          ),
        ),
      ),
    );
  }
}

class _ViewModel {
  final Function() onStart;
  final Function() onFinish;
  final Function() onRequestTime;

  _ViewModel({
    @required this.onStart,
    @required this.onFinish,
    @required this.onRequestTime,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onStart: () => store.dispatch(
            TimerStartedAction(timer: TimerModel(start: DateTime.now()))),
        onFinish: () => store.dispatch(TimerFinishedAction(
            timer: store.state.timer.copyWith(end: DateTime.now()))),
        onRequestTime: () =>
            store.dispatch(TimerRequestedAction(timer: store.state.timer)));
  }
}
