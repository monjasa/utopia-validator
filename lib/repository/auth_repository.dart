import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseAuth auth = GetIt.instance<FirebaseAuth>();
  final GoogleSignIn googleSignIn = GetIt.instance<GoogleSignIn>();

  Future<UserCredential> signIn() async {
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return await auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    auth.signOut();
    googleSignIn.disconnect();
  }
}
