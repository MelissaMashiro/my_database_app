import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/features/users_list/users_list_provider.dart';
import 'package:meli_flutter_app/src/theme/spacing.dart';
import 'package:meli_flutter_app/src/widgets/CustomTextField.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class UpdateUserScreen extends StatefulWidget {
  const UpdateUserScreen({
    required this.userId,
    Key? key,
  }) : super(key: key);
  final String userId;

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  late TextEditingController _emailController;
  late TextEditingController _lastnameController;
  late TextEditingController _nameController;
  late TextEditingController _ageController;
  @override
  void initState() {
    _lastnameController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _ageController = TextEditingController();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      _fetchUserData();
    });
    super.initState();
  }

  void _fetchUserData() async {
    final user =
        await context.read<UserListProvider>().readSingleUser(widget.userId);
    if (user != null) {
      _nameController = TextEditingController(text: user.name);
      _lastnameController = TextEditingController(text: user.lastname);
      _emailController = TextEditingController(text: user.email);
      _ageController = TextEditingController(text: user.age.toString());
      setState(() {});
    }
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
                  Icons.edit_note_rounded,
                  color: Colors.deepPurple,
                  size: 100.0,
                ),
                const SizedBox(
                  height: Spacing.medium * 3,
                ),
                Text(
                  'EDITING USER',
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
                ),
                //password
                const SizedBox(
                  height: Spacing.large,
                ),
                //button
                RoundedButton(
                  text: 'ACTUALIZAR USUARIO',
                  onTap: () async {
                    await context.read<UserListProvider>().updateUser(
                          userEditingId: widget.userId,
                          name: _nameController.text,
                          email: _emailController.text,
                          age: int.parse(_ageController.text),
                          lastname: _lastnameController.text,
                        );
                    Navigator.popUntil(
                      context,
                      ModalRoute.withName(NamedRoute.users_list_page),
                    );
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
