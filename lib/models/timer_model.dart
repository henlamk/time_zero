class TimerModel {
  final DateTime start;
  final DateTime end;

  TimerModel({
    this.start,
    this.end,
  });

  toJson() {}

  TimerModel copyWith({DateTime start, DateTime end}) {
    return TimerModel(
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }
}
