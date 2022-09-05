import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/models/user.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  @override
  void initState() {
    _analytics.setCurrentScreen(screenName: 'Read users Screen');
    super.initState();
  }

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
                    leading: const Icon(Icons.person),
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

  Future<User?> _readSingleUser() async {
    try {
      final docUser =
          FirebaseFirestore.instance.collection('/users').doc('userId');
      final snapshot = await docUser.get();
      if (snapshot.exists) {
        return User.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    } catch (e) {
      print('error --> $e');
      return null;
    }
  }
}
