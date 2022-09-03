import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/theme/spacing.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              text: 'READ DATA',
              onTap: () {
                Navigator.pushNamed(context, NamedRoute.users_list_page);
              },
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            RoundedButton(
              text: 'DELETE DATA',
              onTap: () {
                Navigator.pushNamed(context, NamedRoute.users_list_page);
              },
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
            RoundedButton(
              text: 'UPDATE DATA',
              onTap: () {
                Navigator.pushNamed(context, NamedRoute.update_user_page);
              },
            ),
            const SizedBox(
              height: Spacing.medium,
            ),
          ],
        ),
      ),
    );
  }
}
