import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/models/user.dart';

class DeleteUserScreen extends StatelessWidget {
  const DeleteUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: StreamBuilder<List<User>>(
        stream: _readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.delete),
                    trailing: Text(
                      users[index].name,
                      style: const TextStyle(
                        color: Colors.green,
                        fontSize: 15,
                      ),
                    ),
                    title: Text(
                      users[index].id,
                    ),
                    onTap: () => _deleteUser(users[index].id),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _deleteUser(String userId) {
    final docUser = FirebaseFirestore.instance.collection('users').doc(userId);

    docUser.delete();
  }

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
}
