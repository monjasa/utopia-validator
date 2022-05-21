import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/auth/auth_bloc.dart';
import 'package:utopia_validator/bloc/home/home_bloc.dart';
import 'package:utopia_validator/presentation/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UserAuthenticated) {
            BlocProvider.of<HomeBloc>(context).add(HomeLoadEvent());
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is UserUnauthenticated) {
              return Center(
                child: _buildSignInButton(context),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  void _signInWithGoogle(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(SignInRequestEvent());
  }

  Widget _buildSignInButton(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset(
        'assets/images/google.png',
        width: 32,
        height: 32,
      ),
      label: const Text(
        'Sign in with Google',
        style: TextStyle(color: Colors.black54),
      ),
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () {
        _signInWithGoogle(context);
      },
    );
  }
}
