import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/theme/spacing.dart';
import 'package:meli_flutter_app/src/widgets/rounded_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.analytics}) : super(key: key);
  final FirebaseAnalytics? analytics;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  @override
  void initState() {
    print('init state');
    if (widget.analytics != null) {
      // print('enviado metrica-->');
      // widget.analytics!.setUserId(id: 'some-user-id');
      // widget.analytics!.logEvent(
      //     name: 'app_in_home_page', parameters: {'nombre_persona': 'Melissa'});
    }
    _analytics.setUserId(id: 'otro-user-id');
    // _analytics.logEvent(
    //     name: 'app_in_home_page', parameters: {'nombre_persona': 'Melissta'});
      //_analytics.logEvent(  name: 'app_in_home_page', parameters: {'nombre_persona': 'Melissta'});
    _analytics.setCurrentScreen(screenName: 'Home Screen');
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
                Navigator.pushNamed(context, NamedRoute.delete_user_page);
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
