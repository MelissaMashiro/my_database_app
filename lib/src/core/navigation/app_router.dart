import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/features/delete_user/delete_user_screen.dart';
import 'package:meli_flutter_app/src/features/error/error_screen.dart';
import 'package:meli_flutter_app/src/features/home/home_screen.dart';
import 'package:meli_flutter_app/src/features/login/login_page.dart';
import 'package:meli_flutter_app/src/features/register/register_page.dart';
import 'package:meli_flutter_app/src/features/update_user/update_user_screen.dart';
import 'package:meli_flutter_app/src/features/users_list/users_list_screen.dart';

class AppRouter {
  static RouteFactory get generatedRoutes => (RouteSettings settings) {
        ModalRoute? route;

        var argumentsMap = settings.arguments as Map<String, dynamic>?;

        switch (settings.name) {
          case NamedRoute.login:
            route = MaterialPageRoute(
              builder: (_) => const LoginPage(),
              settings: RouteSettings(name: settings.name),
            );
            break;
          case NamedRoute.register:
            route = MaterialPageRoute(
              builder: (_) => const RegisterPage(),
              settings: RouteSettings(name: settings.name),
            );
            break;
            case NamedRoute.home:
            route = MaterialPageRoute(
              builder: (_) => const HomeScreen(),
              settings: RouteSettings(name: settings.name),
            );
            break;
             case NamedRoute.delete_user_page:
            route = MaterialPageRoute(
              builder: (_) => const DeleteUserScreen(),
              settings: RouteSettings(name: settings.name),
            );
            break;
             case NamedRoute.update_user_page:
            route = MaterialPageRoute(
              builder: (_) => const UpdateUserScreen(),
              settings: RouteSettings(name: settings.name),
            );
            break;
             case NamedRoute.users_list_page:
            route = MaterialPageRoute(
              builder: (_) => const UsersListScreen(),
              settings: RouteSettings(name: settings.name),
            );
            break;

          case NamedRoute.error:
          default:
            route = MaterialPageRoute(
              builder: (_) => const ErrorScreen(),
              settings: RouteSettings(name: settings.name),
            );
            break;
        }

        return route;
      };
}
