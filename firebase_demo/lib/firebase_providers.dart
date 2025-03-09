import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final Provider<FirebaseAuth> authProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final Provider<FirebaseFirestore> storeProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final Provider<GoogleSignIn> googleSignInProvider =
    Provider<GoogleSignIn>((ref) => GoogleSignIn());
