import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/databases/firebase_service.dart';
import 'package:meli_flutter_app/src/databases/hive_database.dart';
import 'package:meli_flutter_app/src/databases/sembast_database.dart';
import 'package:meli_flutter_app/src/databases/sqflite_database.dart';
import 'package:meli_flutter_app/src/models/user.dart';

enum StorageDataType {
  firebase,
  sqflite,
  sembost,
  hive,
}

class UserListProvider with ChangeNotifier {
  StorageDataType _storageDataType = StorageDataType.firebase;

  List<User> _usersList = [];
  List<User> get userList => _usersList;

  set userList(List<User> list) {
    _usersList = list;
    notifyListeners();
  }

  set storageDataType(StorageDataType value) {
    _storageDataType = value;
    notifyListeners();
  }

  Future<void> createUser({
    required String name,
    required String lastname,
    required String email,
    required int age,
  }) async {
    final user = User(
      name: name,
      lastname: lastname,
      email: email,
      age: age,
    );
    switch (_storageDataType) {
      case StorageDataType.firebase:
        await FirebaseService.instance.createUser(
          user: user,
        );
        break;
      case StorageDataType.sqflite:
        await SqfliteDatabase.instance.addUser(
          user,
        );
        break;
      case StorageDataType.hive:
        await HiveDatabase.instance.addUser(
          user,
        );
        break;
      case StorageDataType.sembost:
        await SembastDatabase.instance.insertUser(
          user,
        );
        break;
      default:
    }
  }

  Future<void> deleteUser(dynamic userId) async {
    switch (_storageDataType) {
      case StorageDataType.firebase:
        await FirebaseService.instance.deleteUser(userId);
        await readAllUsers();
        break;
      case StorageDataType.sqflite:
        await SqfliteDatabase.instance.removeUser(userId);
        await readAllUsers();
        break;
      case StorageDataType.hive:
        await HiveDatabase.instance.removeUser(userId);
        await readAllUsers();
        break;
      case StorageDataType.sembost:
        await SembastDatabase.instance.delete(userId);
        await readAllUsers();
        break;
      default:
    }
  }

  Future<User?> readSingleUser(dynamic userId) async {
    switch (_storageDataType) {
      case StorageDataType.firebase:
        return await FirebaseService.instance.readSingleUser(userId);
      case StorageDataType.sqflite:
        return await SqfliteDatabase.instance.readSingleUser(userId);
      case StorageDataType.hive:
        return await HiveDatabase.instance.readSingleUser(userId);
      case StorageDataType.sembost:
        return await SembastDatabase.instance.getSingleUser(userId);
      default:
        return null;
    }
  }

  Future<void> readAllUsers() async {
    switch (_storageDataType) {
      case StorageDataType.firebase:
        userList = await FirebaseService.instance.readUsers();
        break;
      case StorageDataType.sqflite:
        userList = await SqfliteDatabase.instance.readUsers();
        break;
      case StorageDataType.hive:
        userList = await HiveDatabase.instance.readUsers();
        break;
      case StorageDataType.sembost:
        userList = await SembastDatabase.instance.getAllUsers();
        break;
      default:
    }
  }

  Future<void> updateUser({
    required dynamic userEditingId,
    required String name,
    required String lastname,
    required String email,
    required int age,
  }) async {
    final user = User(
      id: userEditingId,
      name: name,
      lastname: lastname,
      email: email,
      age: age,
    );
    switch (_storageDataType) {
      case StorageDataType.firebase:
        await FirebaseService.instance.updateUser(
          user: user,
        );
        break;
      case StorageDataType.sqflite:
        await SqfliteDatabase.instance.update(
          user,
        );
        break;
      case StorageDataType.hive:
        await HiveDatabase.instance.updateUser(
          user,
        );
        break;
      case StorageDataType.sembost:
        await SembastDatabase.instance.updateUser(
          user,
        );
        break;
      default:
    }
  }
}
