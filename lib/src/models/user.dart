class User {
  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.age,
    required this.email,
  });

  final dynamic id;
  final String name;
  final String lastname;
  final int age;
  final String email;

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        age: json['age'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() {
    final map = {
      'id': id,
      'name': name,
      'lastname': lastname,
      'age': age,
      'email': email,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }
}
