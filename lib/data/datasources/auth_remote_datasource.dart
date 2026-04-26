import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_chat_app/presentation/export/auth_exports.dart';

import '../models/user_model.dart';

class AuthRemoteDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Get Current User
  User? get currentUser => _auth.currentUser;

  // Stream (for auth state changes)
  //Listen to login/logout changes in real-time
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // =========================================================
  // Email & Password - Register
  // =========================================================
  Future<User?> register({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  // =========================================================
  // Email & Password - Login
  // =========================================================
  Future<User?> login({required String email, required String password}) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthError(e);
    }
  }

  //Google Sign In
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      throw "Google sign-in failed";
    }
  }

  // Logout
  // =========================================================
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // =========================================================
  // ❌ Error Handling
  // =========================================================
  String _handleAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return "Email already in use";
      case 'invalid-email':
        return "Invalid email";
      case 'weak-password':
        return "Weak password";
      case 'user-not-found':
        return "User not found";
      case 'wrong-password':
        return "Wrong password";
      default:
        return "Something went wrong";
    }
  }
  Future<void> saveUser(User user) async {
    final userData = {
      'uid': user.uid,
      'name': user.displayName ?? "User",
      'email': user.email,
      'image': user.photoURL,
    };

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set(userData);
  }
  Stream<List<UserModel>> getUsers() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromMap(doc.data());
      }).toList();
    });
  }
}
