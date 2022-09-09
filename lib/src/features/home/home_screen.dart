import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/features/users_list/users_list_provider.dart';
import 'package:meli_flutter_app/src/theme/spacing.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userListProvider = context.read<UserListProvider>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              backgroundColor: Colors.orangeAccent,
              text: 'USE FIREBASE CLOUD',
              onTap: () {
                userListProvider.storageDataType = StorageDataType.firebase;
                Navigator.pushNamed(context, NamedRoute.users_list_page);
              },
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            RoundedButton(
              text: 'READ DATA',
              onTap: () {
                //Navigator.pushNamed(context, NamedRoute.users_list_page);
              },
            ),
          ],
        ),
      ),
    );
  }
}
