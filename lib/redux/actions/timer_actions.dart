import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:time_zero/models/app_state_model.dart';
import 'package:time_zero/models/timer_model.dart';

class TimerStartedAction extends Equatable {
  final TimerModel timer;

  TimerStartedAction({this.timer});

  @override
  List<Object> get props => [timer];
}

class TimerStartedFailedAction {
  TimerStartedFailedAction();
}

class TimerFinishedAction extends Equatable {
  final TimerModel timer;

  TimerFinishedAction({this.timer});

  @override
  List<Object> get props => [timer];
}

class TimerFinishedFailedAction {
  TimerFinishedFailedAction();
}

class TimerRequestedAction extends Equatable {
  final TimerModel timer;

  TimerRequestedAction({this.timer});

  @override
  List<Object> get props => [timer];
}

class TimerUpdatedFailedAction {
  TimerUpdatedFailedAction();
}

ThunkAction<AppState> startTimer() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        TimerStartedAction(timer: store.state.timer),
      );
    } catch (exc) {
      print(exc);
    }
  };
}

ThunkAction<AppState> finishTimer() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        TimerFinishedAction(timer: store.state.timer),
      );
    } catch (exc) {
      print(exc);
    }
  };
}

ThunkAction<AppState> requestTimer() {
  return (Store<AppState> store) async {
    try {
      store.dispatch(
        TimerRequestedAction(
          timer: store.state.timer,
        ),
      );
    } catch (exc) {
      print(exc);
    }
  };
}
