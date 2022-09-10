import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/features/users_list/users_list_provider.dart';
import 'package:provider/provider.dart';
import 'src/core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserListProvider()),
      ],
      child: MaterialApp(
        color: Colors.deepPurple,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: AppRouter.generatedRoutes,
      ),
    );
  }
}
