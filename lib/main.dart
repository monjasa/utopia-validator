import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utopia_validator/bloc/auth/auth_bloc.dart';
import 'package:utopia_validator/bloc/home/home_bloc.dart';
import 'package:utopia_validator/bloc/scanner/scanner_bloc.dart';
import 'package:utopia_validator/presentation/auth_page.dart';
import 'package:utopia_validator/repository/auth_repository.dart';
import 'package:utopia_validator/repository/home_repository.dart';
import 'package:utopia_validator/repository/scanner_repository.dart';
import 'package:utopia_validator/service/service_locator.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initializeFirebaseApp().whenComplete(() => setup());
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
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
        ),
        RepositoryProvider<ScannerRepository>(
          create: (context) => ScannerRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              RepositoryProvider.of<HomeRepository>(context),
            ),
          ),
          BlocProvider<ScannerBloc>(
            create: (context) => ScannerBloc(
              RepositoryProvider.of<ScannerRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Utopia Validator',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          home: const AuthPage(),
        ),
      ),
    );
  }
}

Future<FirebaseApp> _initializeFirebaseApp() async {
  return Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
