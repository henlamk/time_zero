class TimerModel {
  final DateTime start;
  final DateTime end;

  bool get isRunning => start != null;
  String get passed => DateTime.now().difference(start).inMinutes.toString();

  TimerModel({
    this.start,
    this.end,
  });

  toJson() {}

  TimerModel copyWith({DateTime start, DateTime end, double passedTime}) {
    var timer = TimerModel(
      start: start ?? this.start,
      end: end ?? this.end,
    );

    return timer;
  }
}
