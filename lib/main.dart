import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_zero/app.dart';

import 'redux/store.dart';

void main() async {
  final store = await createReduxStore();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  runApp(TimeZeroApp(store));
}
