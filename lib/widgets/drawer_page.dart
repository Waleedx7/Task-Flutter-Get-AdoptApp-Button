import 'package:adopt_app/models/users.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return context.watch<AuthProvider>().isAuth
        ? ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text("Welcome ${authProvider.user.username}"),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: const Text("Logout"),
                trailing: const Icon(Icons.logout),
                onTap: () {
                  context.read<AuthProvider>().logout();
                },
              ),
            ],
          )
        : ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                child: Text('Please Signup or Signin'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Sign Up'),
                trailing: const Icon(Icons.login),
                onTap: () {
                  context.push('/signup');
                },
              ),
              ListTile(
                title: const Text("Signin"),
                trailing: const Icon(Icons.login),
                onTap: () {
                  context.push('/signin');
                },
              ),
            ],
          );
  }
}
