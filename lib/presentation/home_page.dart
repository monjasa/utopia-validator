import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/auth_bloc.dart';
import 'package:utopia_validator/presentation/auth_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          tooltip: "Log Out",
          icon: const Icon(Icons.exit_to_app),
          onPressed: () => _signOut(context),
        ),
      ]),
      body: const Center(
        child: Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Scanner",
        onPressed: () => log("pressed scanner"),
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }
}

void _signOut(BuildContext context) {
  log("firing sign-out event");
  BlocProvider.of<AuthBloc>(context).add(
    SignOutRequestEvent(),
  );
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const AuthPage()),
    (route) => false,
  );
}
