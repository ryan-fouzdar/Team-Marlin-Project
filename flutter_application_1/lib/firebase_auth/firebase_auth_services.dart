import "package:firebase_auth/firebase_auth.dart";

class FireBaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Logging the error code and message
      print("FirebaseAuthException during signup: ${e.code} - ${e.message}");
      // Handle specific error codes with custom actions
      switch (e.code) {
        case 'weak-password':
          print('The password provided is too weak.');
          break;
        case 'email-already-in-use':
          print('The account already exists for that email.');
          break;
        default:
          print('Unhandled error: ${e.message}');
      }
    } catch (e) {
      print("General exception occurred during signup: $e");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      // Logging the error code and message
      print("FirebaseAuthException during signin: ${e.code} - ${e.message}");
      // Handle specific error codes with custom actions
      switch (e.code) {
        case 'user-not-found':
          print('No user found for that email.');
          break;
        case 'wrong-password':
          print('Wrong password provided for that user.');
          break;
        default:
          print('Unhandled error: ${e.message}');
      }
    } catch (e) {
      print("General exception occurred during signin: $e");
    }
    return null;
  }
}
