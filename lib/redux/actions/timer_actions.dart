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

class TimerTickAction extends Equatable {
  final TimerModel timer;

  TimerTickAction({this.timer});

  @override
  // TODO: implement props
  List<Object> get props => [timer];
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
