import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:time_zero/models/app_state_model.dart';

import 'middleware/logging.dart';
import 'reducers/index.dart';

Future<Store<AppState>> createReduxStore() async {
  WidgetsFlutterBinding.ensureInitialized();

  return DevToolsStore<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: [
      thunkMiddleware,
      LoggingMiddleware(),
    ],
  );
}
