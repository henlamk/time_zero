import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_zero/home_scaffold.dart';
import 'package:time_zero/util/colors.dart';

import 'models/app_state_model.dart';
import 'redux/actions/user_actions.dart';
import 'screens/home/home.dart';

class Routes {
  static final homeScreen = "/home";
}

class Keys {
  static final navKey = new GlobalKey<NavigatorState>();
}

class TimeZeroApp extends StatefulWidget {
  final Store<AppState> store;

  TimeZeroApp(this.store);

  @override
  _TimeZeroAppState createState() => _TimeZeroAppState();
}

class _TimeZeroAppState extends State<TimeZeroApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Time Zero',
        theme: ThemeData(
          primaryColor: CustomColors.white,
          accentColor: CustomColors.accent,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.kulimParkTextTheme(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        home: StoreBuilder<AppState>(
          onInit: (store) {
            // store.dispatch(loadUserData());
          },
          builder: (BuildContext context, Store<dynamic> store) => Home(
            store: store,
          ),
        ),
        navigatorKey: Keys.navKey,
        routes: {
          Routes.homeScreen: (context) => HomeScaffold(),
        },
        debugShowCheckedModeBanner: true,
      ),
    );
  }
}
