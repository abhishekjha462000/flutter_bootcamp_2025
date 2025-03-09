import 'package:firebase_demo/auth_repository.dart';
import 'package:firebase_demo/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider<AuthController>(
  (ref) => AuthController(
    repository: ref.read(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository _repository;

  AuthController({required AuthRepository repository})
      : _repository = repository;

  void signInWithGoogle(BuildContext context, WidgetRef ref) async {
    final user = await _repository.signIn(ref);
    user.fold((l) => showSnackBar(context, l.message), (r) => print(r));
  }
}
