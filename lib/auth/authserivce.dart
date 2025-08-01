import 'package:firebase_auth/firebase_auth.dart';

class Authservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInAnonymous() async {
    try {
      final credentail = await _auth.signInAnonymously();
      return credentail.user;
    } catch (e) {
      print("Error Signing In the User");
      return null;
    }
  }

  User? getUser() {
    return _auth.currentUser;
  }
}
