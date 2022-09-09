import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/models/user.dart';
import 'package:meli_flutter_app/src/services/firebase_service.dart';

enum StorageDataType {
  firebase,
  flutterSecureStorage,
  sembost,
  hive,
}

class UserListProvider with ChangeNotifier {
  StorageDataType _storageDataType = StorageDataType.firebase;

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
    switch (_storageDataType) {
      case StorageDataType.firebase:
        await FirebaseService.instance.createUser(
          name: name,
          email: email,
          age: age,
          lastname: lastname,
        );
        break;
      default:
    }
  }

  Future<void> deleteUser(String userId) async {
    switch (_storageDataType) {
      case StorageDataType.firebase:
        return await FirebaseService.instance.deleteUser(userId);
      default:
    }
  }

   Future<User?> readSingleUser(String userId) async {
    switch (_storageDataType) {
      case StorageDataType.firebase:
        return await FirebaseService.instance.readSingleUser(userId);
      default:
      return null;
    }
  }

  Stream<List<User>>? readUsers() {
    switch (_storageDataType) {
      case StorageDataType.firebase:
        return FirebaseService.instance.readUsers();
      default:
        return null;
    }
  }

  Future<void> updateUser({
    required String userEditingId,
    required String name,
    required String lastname,
    required String email,
    required int age,
  }) async{
    switch (_storageDataType) {
      case StorageDataType.firebase:
        await FirebaseService.instance.updateUser(
          userEditingId: userEditingId,
          name: name,
          email: email,
          age: age,
          lastname: lastname,
        );
        break;
      default:
    }
  }
}
