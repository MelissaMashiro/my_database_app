class User {
  User({
    required this.id,
    required this.name,
    required this.lastname,
    required this.age,
    required this.email,
  });

  final String id;
  final String name;
  final int age;
  final String email;
  final String lastname;

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        lastname: json['lastname'],
        age: json['age'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastname': lastname,
        'age': age,
        'email': email,
      };
}
