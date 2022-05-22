import 'package:flutter/material.dart';

class User {
  final String email;
  final String password;

  User(
      this.email,
      this.password,
      );

  @override
  String toString() {
    debugPrint('chegou em models.user');

    return 'User{E-mail: $email, Senha: $password}';
  }
}