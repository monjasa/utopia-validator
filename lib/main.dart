import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/auth_bloc.dart';
import 'package:utopia_validator/presentation/home_page.dart';
import 'package:utopia_validator/repository/auth_repository.dart';

  runApp(const UtopiaValidatorApp());
}

class UtopiaValidatorApp extends StatelessWidget {
  const UtopiaValidatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Utopia Validator',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
