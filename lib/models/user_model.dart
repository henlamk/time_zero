class User {
  final String id;

  User({
    this.id,
  });

  factory User.fromJson() => User(id: '1');

  Map<String, dynamic> toJson() {
    return {"id": id};
  }

  User copyWidth({
    String id,
  }) {
    return User(id: id ?? this.id);
  }
  /*
  Todo copyWith({int id, String text, bool completed}) {
    return new Todo(
      id: id ?? this.id,
      text: text ?? this.text,
      completed: completed ?? this.completed,
    );
  }
  */
}
