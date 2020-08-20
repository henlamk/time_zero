import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:time_zero/models/app_state_model.dart';
import 'package:time_zero/models/timer_model.dart';
import 'package:time_zero/redux/actions/timer_actions.dart';
import 'package:time_zero/util/colors.dart';
import 'package:flutter_redux/flutter_redux.dart';

class History extends StatefulWidget {
  final DevToolsStore<AppState> store;
  History({
    Key key,
    this.store,
  }) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) => Column(
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
            widget.store?.state?.timer?.start?.toString() ?? '00:00',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class _ViewModel {
  final Function() onStart;

  _ViewModel({
    @required this.onStart,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      onStart: () => store.dispatch(
        TimerStartedAction(timer: TimerModel(start: DateTime.now())),
      ),
    );
  }
}
