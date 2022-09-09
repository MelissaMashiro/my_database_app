
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/theme/theme.dart';
import 'package:meli_flutter_app/src/widgets/CustomTextField.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(fontSize: 36.0),
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
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
                RoundedButton(
                  text: 'Sign In',
                  onTap: () {
                    Navigator.pushNamed(context, NamedRoute.home);
                  },
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, NamedRoute.user_creation),
                  child: const Text(
                    'Not a member? \n Register Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ),
                //registration message button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
