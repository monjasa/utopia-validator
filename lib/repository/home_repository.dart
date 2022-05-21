import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

class HomeRepository {
  final FirebaseAuth auth = GetIt.instance<FirebaseAuth>();

  User getCurrentUser() {
    final currentUser = auth.currentUser;
    if (currentUser == null) {
      throw ArgumentError.notNull();
    }
    return currentUser;
  }
}
