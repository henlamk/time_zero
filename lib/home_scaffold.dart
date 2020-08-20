import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:time_zero/app.dart';

import 'screens/home/home.dart';

class HomeScaffold extends StatefulWidget {
  final Store<dynamic> store;

  HomeScaffold({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  _HomeScaffoldState createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          child: Container(
            child: Center(
              child: Icon(
                Icons.timer,
                size: 75,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
