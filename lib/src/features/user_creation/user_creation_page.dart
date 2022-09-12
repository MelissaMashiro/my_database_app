import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/features/users_list/users_list_provider.dart';
import 'package:meli_flutter_app/src/theme/theme.dart';
import 'package:meli_flutter_app/src/widgets/CustomTextField.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class UserCreationPage extends StatefulWidget {
  const UserCreationPage({
    Key? key,
  }) : super(key: key);
  @override
  State<UserCreationPage> createState() => _UserCreationPageState();
}

class _UserCreationPageState extends State<UserCreationPage> {
  late TextEditingController _emailController;
  late TextEditingController _lastnameController;
  late TextEditingController _nameController;
  late TextEditingController _ageController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _lastnameController = TextEditingController();
    _nameController = TextEditingController();
    _ageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
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
                  'CREATING NEW USER',
                  style: GoogleFonts.bebasNeue(fontSize: 36.0),
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                const Text(
                  'Nombre',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                CustomTextField(
                  controller: _nameController,
                  hintText: 'Name',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                const Text(
                  'Apellido',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                CustomTextField(
                  controller: _lastnameController,
                  hintText: 'Lastname',
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: Spacing.medium,
                ),
                const Text(
                  'Edad',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                CustomTextField(
                  controller: _ageController,
                  hintText: 'Age',
                  textInputType: TextInputType.number,
                ),
                const SizedBox(
                  height: Spacing.large,
                ),
                RoundedButton(
                  text: 'CREAR',
                  onTap: () async {
                    await context.read<UserListProvider>().createUser(
                          name: _nameController.text,
                          email: _emailController.text,
                          age: int.parse(_ageController.text),
                          lastname: _lastnameController.text,
                        );
                    Navigator.popUntil(context,
                        ModalRoute.withName(NamedRoute.users_list_page));
                  },
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
}
