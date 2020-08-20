import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:time_zero/models/app_state_model.dart';
import 'package:time_zero/models/timer_model.dart';
import 'package:time_zero/redux/actions/timer_actions.dart';
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: model.onStart,
              child: Container(
                child: Icon(Icons.play_arrow, size: 75),
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: CustomColors.info,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 24),
            Text(
              widget.store.state.timer.start != null
                  ? DateFormat('hh:mm').format(widget.store.state.timer.start)
                  : '00:00',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),
            widget.store.state.timer.start != null
                ? Text(
                    DateTime.now()
                        .difference(widget.store.state.timer.start)
                        .toString(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  final Function() onStart;
  final Function() onTimerTick;

  _ViewModel({
    @required this.onStart,
    @required this.onTimerTick,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
        onStart: () => store.dispatch(
            TimerStartedAction(timer: TimerModel(start: DateTime.now()))),
        onTimerTick: () =>
            store.dispatch(TimerTickAction(timer: TimerModel())));
  }
}
