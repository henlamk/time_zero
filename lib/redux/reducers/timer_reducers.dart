import 'package:redux/redux.dart';
import 'package:time_zero/models/timer_model.dart';
import 'package:time_zero/redux/actions/timer_actions.dart';

final timerReducer = combineReducers<TimerModel>([
  TypedReducer<TimerModel, TimerStartedAction>(_timerStarted),
  TypedReducer<TimerModel, TimerFinishedAction>(_timerFinished),
  TypedReducer<TimerModel, TimerRequestedAction>(_timerUpdated),
]);

TimerModel _timerStarted(TimerModel timer, TimerStartedAction action) {
  return action.timer;
}

TimerModel _timerFinished(TimerModel timer, TimerFinishedAction action) {
  return action.timer;
}

TimerModel _timerUpdated(TimerModel timer, TimerRequestedAction action) {
  return action.timer;
}
