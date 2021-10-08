import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PiramidimFirebaseUser {
  PiramidimFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

PiramidimFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PiramidimFirebaseUser> piramidimFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<PiramidimFirebaseUser>(
        (user) => currentUser = PiramidimFirebaseUser(user));
