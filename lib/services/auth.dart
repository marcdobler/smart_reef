import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/user_profile.dart';
import 'database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj base on UserCredential
  UserProfile _userFromUserCredential(User user) {
    return user != null ? UserProfile(uid: user.uid) : null;
  }

  // Auth change user stream
  Stream<UserProfile> get user {
    return _auth.authStateChanges().map(_userFromUserCredential);
  }

  Future getCurrentUID() async {
    final User user = _auth.currentUser;
    return _userFromUserCredential(user);
  }

  // Sign in anonymously
  Future signInAnonymously() async {
    try {
      final UserCredential userCredential = await _auth.signInAnonymously();
      final User user = userCredential.user;
      return _userFromUserCredential(user);
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  // Sign in email password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      final User user = userCredential.user;
      return _userFromUserCredential(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: avoid_print
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: avoid_print
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  // User Register possibility

  // With email and password
  Future registerUserWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User user = userCredential.user;

      // Create a new document for the user with the uid just to try
      await DatabaseService(uid: user.uid)
          .updateUserData(30, 30, 30, 'Pico Reef', 'SPS');

      return _userFromUserCredential(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: avoid_print
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: avoid_print
        print('The account already exists for that email.');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }

  // With Google
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    // ignore: unnecessary_await_in_return
    return await _auth.signInWithCredential(credential);
  }

  // Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
