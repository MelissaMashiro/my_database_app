import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meli_flutter_app/src/models/user.dart';

class FirebaseService {
  FirebaseService._internal();
  static final FirebaseService _instance = FirebaseService._internal();
  static FirebaseService get instance => _instance;

  Stream<List<User>>? _readUsers() {
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
      print('error --> $e');
      return null;
    }
  }

  Future _createUser({
    required String name,
    required String email,
    required int age,
    required String password,
  }) async {
    try {
      //Asi se crea con un id especifico
      //final docUser = FirebaseFirestore.instance.collection('users').doc('my-id1');

      //Crea id automatico
      final docUser = FirebaseFirestore.instance.collection('users').doc();

      final newUser = User(
        id: docUser.id,
        name: name,
        age: age,
        email: email,
        password: password,
      );

      ///Create document and write data on firestore
      await docUser.set(newUser.toJson());

      //  Navigator.popUntil(context, ModalRoute.withName(NamedRoute.login));
    } catch (e) {
      print('ERROR');
    }
  }

  void _deleteUser(String userId) {
    final docUser = FirebaseFirestore.instance.collection('users').doc(userId);

    docUser.delete();
  }

  void _updateAge(int newAge) {
    try {
      final docUser = FirebaseFirestore.instance
          .collection('users')
          .doc('NUV88nfHOTchg1ajZggW');

      docUser.update({
        'age': newAge,
      });

      ///en caso de que quisieramos editar un atributo dentro de un objeto, seria:
      //  docUser.update({
      //   'city.name': 'Barranquilla',
      // });

      ///En caso de querer reemplazar toda la data(campos) de ese doc(user) por data y campos nuevos, es:
      //  docUser.set({
      //   'name': 'Sydney',
      //   'ocupation':'Systems Engineer',
      // });

      ///En caso de querer borrar un campo (con todo y campo, no  el valor)
      //  docUser.update({
      //   'name': FieldValue.delete(),
      // });
      // Navigator.popUntil(context, ModalRoute.withName(NamedRoute.home));
    } catch (e) {
      print(e);
    }
  }
}
