import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/theme/spacing.dart';
import 'package:meli_flutter_app/src/widgets/CustomTextField.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({Key? key}) : super(key: key);

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  late TextEditingController _ageController;
  @override
  void initState() {
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('EDITING MELISSAS AGE'),
            const SizedBox(
              height: Spacing.large,
            ),
            CustomTextField(
              controller: _ageController,
              hintText: 'Edad',
            ),
            RoundedButton(
              text: 'UPDATE',
              onTap: _update,
            )
          ],
        ),
      ),
    );
  }

  void _update() {
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc('NUV88nfHOTchg1ajZggW');

    docUser.update({
      'age': '${int.parse(_ageController.text)}',
    });

    ///en caso de que quisieramos editar un atributo dentro de un objeto, seria:
    //  docUser.update({
    //   'city.name': 'Barranquilla',
    // });
  }
}
