import 'package:flutter/material.dart';
import 'package:meli_flutter_app/src/core/navigation/named_route.dart';
import 'package:meli_flutter_app/src/features/users_list/users_list_provider.dart';
import 'package:meli_flutter_app/src/models/user.dart';
import 'package:provider/provider.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  void initState() {
    context.read<UserListProvider>().readUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Long press to Edit'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, NamedRoute.user_creation)
                    .then((_) => context.read<UserListProvider>().readUsers()),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Consumer<UserListProvider>(builder: (_, userListProvider, __) {
        print('consumiendo---->');
        final users = context.read<UserListProvider>().userList;
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onLongPress: () => Navigator.pushNamed(
                context,
                NamedRoute.update_user_page,
                arguments: {
                  'userId': users[index].id,
                },
              ).then((_) => userListProvider.readUsers()),
              leading: PopupMenuButton<int>(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.delete),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Delete User')
                      ],
                    ),
                    onTap: () => context
                        .read<UserListProvider>()
                        .deleteUser(users[index].id!),
                  ),
                ],
              ),
              trailing: Text(
                'email: ${users[index].email} Age: ${users[index].age}',
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 15,
                ),
              ),
              title: Text(
                '${users[index].name} ${users[index].lastname}',
              ),
            );
          },
        );
      }),
    );
  }
}
