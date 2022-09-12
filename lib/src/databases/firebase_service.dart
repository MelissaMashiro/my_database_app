import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meli_flutter_app/src/models/user.dart';

class FirebaseService {
  FirebaseService._internal();
  static final FirebaseService _instance = FirebaseService._internal();
  static FirebaseService get instance => _instance;

  Stream<List<User>>? readUsersStream() {
    try {
      final list =
          FirebaseFirestore.instance.collection('/users').snapshots().map(
                (snapshot) => snapshot.docs
                    .map(
                      (doc) => User.fromJson(
                        doc.data(),
                      ),
                    )
                    .toList(),
              );
      return list;
    } catch (e) {
      throw Exception();
    }
  }

  Future<List<User>> readUsers() async {
    try {
      var usersList = <User>[];
      final data = await FirebaseFirestore.instance.collection('/users').get();
      for (var user in data.docs) {
        final newUser = User(
          id: user.data()['id'],
          name: user.data()['name'],
          lastname: user.data()['lastname'],
          age: user.data()['age'],
          email: user.data()['email'],
        );
        usersList.add(newUser);
      }
      return usersList;
    } catch (e) {
      throw Exception();
    }
  }

  Future<User?> readSingleUser(String userId) async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('/users').doc(userId);
      final snapshot = await docUser.get();
      if (snapshot.exists) {
        return User.fromJson(snapshot.data()!);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<void> createUser({
    required User user,
  }) async {
    try {
      //Asi se crea con un id especifico
      //final docUser = FirebaseFirestore.instance.collection('users').doc('my-id1');

      //Crea id automatico
      final docUser = FirebaseFirestore.instance.collection('users').doc();

      final newUser = User(
        id: docUser.id,
        name: user.name,
        lastname: user.lastname,
        age: user.age,
        email: user.email,
      );

      ///Create document and write data on firestore
      await docUser.set(newUser.toJson());

      //  Navigator.popUntil(context, ModalRoute.withName(NamedRoute.login));
    } catch (e) {
      throw Exception();
    }
  }

  Future<void> deleteUser(String userId) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc(userId);

    await docUser.delete();
  }

  Future<void> updateUser({
    required User user,
  }) async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('users').doc(user.id);

      await docUser.update({
        'name': user.name,
        'lastname': user.lastname,
        'email': user.email,
        'age': user.age,
      });

      // Navigator.popUntil(  context, ModalRoute.withName(NamedRoute.users_list_page));
    } catch (e) {
      throw Exception();
    }
  }
}
