import 'package:equatable/equatable.dart';

import 'timer_model.dart';
import 'user_model.dart';

class AppState extends Equatable {
  final User user;
  final TimerModel timer;

  AppState({this.user, this.timer});

  AppState.fromJson(Map<String, dynamic> json)
      : user = json['user'],
        timer = json['timer'];

  factory AppState.initial() => AppState(user: User(), timer: TimerModel());

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'timer': timer.toJson(),
      };

  @override
  String toString() => "$user $timer";

  @override
  List<Object> get props => [user, timer];

  AppState copyWith({
    User user,
    TimerModel timer,
  }) {
    return AppState(
      user: user ?? this.user,
      timer: timer ?? this.timer,
    );
  }
}
