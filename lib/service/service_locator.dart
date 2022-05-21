import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  GetIt.instance.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  GetIt.instance.registerSingleton<GoogleSignIn>(GoogleSignIn());
}
