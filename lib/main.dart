import 'package:adopt_app/pages/add_page.dart';
import 'package:adopt_app/pages/edit_page.dart';
import 'package:adopt_app/pages/home_page.dart';
import 'package:adopt_app/pages/signin_page.dart';
import 'package:adopt_app/pages/signup_page.dart';
import 'package:adopt_app/providers/auth_provider.dart';
import 'package:adopt_app/providers/pets_provider.dart';
import 'package:adopt_app/widgets/add_form.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'models/pet.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<PetsProvider>(create: (_) => PetsProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/signin',
        builder: (context, state) => Signinpage(),
      ),
      GoRoute(
        path: '/add_page',
        builder: (context, state) => const AddPage(),
      ),
      GoRoute(
        path: '/edit_page',
        builder: (context, state) => EditPets(
          pets: state.extra as Pet,
        ),
      ),
    ],
  );
}
