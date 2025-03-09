import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_providers.dart';
import 'package:firebase_demo/typedefs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
    auth: ref.read(authProvider),
    store: ref.read(storeProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

final userProvider = StateProvider<UserModel?>((ref) => null);

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _store;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore store,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _store = store,
        _googleSignIn = googleSignIn;

  FutureEither<UserModel> signIn(WidgetRef ref) async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final CollectionReference users = _store.collection('users');

      final credential = GoogleAuthProvider.credential(
          idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

      // login into firebase using these credentials
      final userCredential = await _auth.signInWithCredential(credential);

      UserModel user;
      if (userCredential.additionalUserInfo!.isNewUser) {
        user = UserModel(
          name: userCredential.user!.displayName ?? 'Untitled',
          profilePic: userCredential.user!.photoURL ?? '',
          uid: '',
          isAuthenticated: true,
          awards: [],
          karma: 0,
          banner: '',
        );

        // Now that we have created the user model we can now save the data into our firestore
        await users.doc(user.uid).set(user.toMap());
      } else {
        user = await getUserData(userCredential.user!.uid).first;
      }

      ref.read(userProvider.notifier).update((_) => user);

      return right(user);
    } on FirebaseException catch (e) {
      throw e.message ?? 'Firebase Exception Happened...';
    } catch (e) {
      rethrow;
    }
  }

  // used to retrieve the user data in real time.
  // This makes us have the real time updates
  Stream<UserModel> getUserData(String uid) {
    final CollectionReference users = _store.collection('users');
    return users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
  }
}
