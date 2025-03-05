import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import 'package:flutter/foundation.dart';

@immutable
class User {
  final String name;
  final int age;

  const User({required this.name, required this.age});

  // CopyWith method
  User copyWith({String? name, int? age}) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  // Equality and hashCode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;

  // toString method
  @override
  String toString() => 'User(name: $name, age: $age)';
}

class UserNotifier extends StateNotifier<User> {
  UserNotifier(super.state);

  void updateName(String name) {
    state = state.copyWith(name: name);
  }
}
