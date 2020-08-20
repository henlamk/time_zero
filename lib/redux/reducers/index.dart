import 'package:time_zero/models/app_state_model.dart';
import 'package:time_zero/redux/reducers/timer_reducers.dart';

import 'user_reducers.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducer(state.user, action),
    timer: timerReducer(state.timer, action),
  );
}
