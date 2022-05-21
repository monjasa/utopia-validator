import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/auth_bloc.dart';
import 'package:utopia_validator/presentation/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          log("listener: ${state.toString()}");
          if (state is Authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            log("builder: ${state.toString()}");
            if (state is Unauthenticated) {
              return Center(
                child: ElevatedButton(
                  child: const Text('Sign in with Google'),
                  onPressed: () {
                    _signInWithGoogle(context);
                  },
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}

void _signInWithGoogle(BuildContext context) {
  BlocProvider.of<AuthBloc>(context).add(
    SignInRequestEvent(),
  );
}
