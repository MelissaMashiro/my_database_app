class User {
  User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.password,
  });

  final String id;
  final String name;
  final int age;
  final String email;
  final String password;

  static User fromJson(Map<String, dynamic> json) => User(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      email: json['email'],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'email': email,
        'password': password,
      };
}
