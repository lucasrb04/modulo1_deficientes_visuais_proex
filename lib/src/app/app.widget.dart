import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/create-account/create_account.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/login/login.view.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/recovery-password/recovery_password.view.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Módulo 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: "/create-account",
      routes: {
        "/": (context) => LoginView(),
        "/login": (context) => LoginView(),
        "/recovery-password": (context) => RecoveyPasswordView(),
        "/create-account": (context) => CreateAccountView(),
      },
    );
  }
}
