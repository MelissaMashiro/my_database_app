import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void initState() {
    _emailController = TextEditingController();

    _passwordController = TextEditingController();
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
                const RoundedButton(text: 'Register'),
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
}
