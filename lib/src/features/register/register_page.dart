import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/models/user.dart';
import 'package:meli_flutter_app/src/theme/theme.dart';
import 'package:meli_flutter_app/src/widgets/CustomTextField.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _nameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.deepPurple,
                  size: 100.0,
                ),
                const SizedBox(
                  height: Spacing.medium * 3,
                ),
                Text(
                  'REGISTRATION',
                  style: GoogleFonts.bebasNeue(fontSize: 36.0),
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Name',
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                CustomTextField(
                  controller: _ageController,
                  hintText: 'Age',
                ),
                //email
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                //password
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  isObscureText: true,
                ),
                const SizedBox(
                  height: Spacing.large,
                ),
                //button
                RoundedButton(
                  text: 'Register',
                  onTap: () => _createUser(
                    name: _nameController.text,
                    email: _emailController.text,
                    age: int.parse(_ageController.text),
                    password: _passwordController.text,
                  ),
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _createUser({
    required String name,
    required String email,
    required int age,
    required String password,
  }) async {
    try {
      //reference to document

      //con un id especificado
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

      Navigator.popUntil(context, ModalRoute.withName(NamedRoute.login));
    } catch (e) {
      print('ERROR');
    }
  }
}
