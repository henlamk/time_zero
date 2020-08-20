import 'package:redux/redux.dart';
import 'package:time_zero/models/user_model.dart';
import 'package:time_zero/redux/actions/user_actions.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, UserDataLoadedAction>(_userDataLoaded),
]);

User _userDataLoaded(User user, UserDataLoadedAction action) {
  return action.user;
}
