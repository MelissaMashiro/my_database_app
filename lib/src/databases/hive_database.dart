import 'dart:math';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meli_flutter_app/src/models/user.dart';

const String usersBox = 'users';

class HiveDatabase {
  HiveDatabase._privateConstructor();
  static final HiveDatabase instance = HiveDatabase._privateConstructor();

//Box == sql table
  // var box = Hive.box('users');

  Future<void> init() async {
    await _adapterRegistration();
    await Hive.initFlutter();
    await _createBoxe();
  }

  Future<void> _adapterRegistration() async {
    //se registra el adapter para no tener q implementar los tojson ni fromjson para usar los objetos user
    //al guardar y extraer la iformacion almacenada
    Hive.registerAdapter(UserAdapter());
  }

  Future<void> _createBoxe() async {
    await Hive.openBox(usersBox);
  }

  Future<void> addUser(User user) async {
    final box = Hive.box(usersBox);

    var random = Random();
    var min = 1;
    var max = 99;
    final idGenerated = min + random.nextInt(max - min);
    final newUser = User(
      id: idGenerated,
      name: user.name,
      lastname: user.lastname,
      age: user.age,
      email: user.email,
    );
    await box.put(newUser.id, newUser);
  }

  List<User> readUsers() {
    var box = Hive.box(usersBox);
    final data = box.values.toList();
    final users = data.cast<User>();
    return users.isNotEmpty ? users : [];
  }

  User readSingleUser(dynamic userId) {
    var box = Hive.box(usersBox);
    final data = box.values.toList();
    final usersList = data.cast<User>();

    final resultUser = usersList.firstWhere(
      (user) => user.id == userId,
    );
    // User user = box.getAt(userId).cast<User>();

    return resultUser;
  }

  Future<void> removeUser(dynamic userId) async {
    final box = Hive.box(usersBox);

    await box.delete(userId);
  }

  Future<void> updateUser(User user) async {
    final box = Hive.box(usersBox);
    await box.put(user.id, user);
  }

  Future<void> clear() async {
    final box = Hive.box(usersBox);

    //remove all records
    await box.clear();
  }
}
