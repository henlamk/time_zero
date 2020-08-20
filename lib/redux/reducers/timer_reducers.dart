import 'package:redux/redux.dart';
import 'package:time_zero/models/timer_model.dart';
import 'package:time_zero/redux/actions/timer_actions.dart';

final timerReducer = combineReducers<TimerModel>([
  TypedReducer<TimerModel, TimerStartedAction>(_timerStarted),
]);

TimerModel _timerStarted(TimerModel user, TimerStartedAction action) {
  return action.timer;
}
