import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  User({
    this.id,
    required this.name,
    required this.lastname,
    required this.age,
    required this.email,
  });

  @HiveField(0)
  final dynamic id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final int age;
  @HiveField(4)
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
