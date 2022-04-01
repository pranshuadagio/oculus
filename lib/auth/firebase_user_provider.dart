import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OculusReleaseFirebaseUser {
  OculusReleaseFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

OculusReleaseFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<OculusReleaseFirebaseUser> oculusReleaseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<OculusReleaseFirebaseUser>(
            (user) => currentUser = OculusReleaseFirebaseUser(user));
