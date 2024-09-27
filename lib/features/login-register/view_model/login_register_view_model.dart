import 'package:flutter/material.dart';
import 'package:movies_and_series_app/features/login-register/view/widgets/login_section.dart';
import 'package:movies_and_series_app/services/auth.dart';

class LoginregisterViewModel {
  authenticate(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    Auth()
        .signInWithEmailAndPassword(
            context: context,
            email: emailController.text,
            password: passwordController.text)
        .catchError((dynamic error) {
      if (error.code.contains('INVALID_LOGIN_CREDENTIALS')) {
        errorMessage('Giriş bilgileriniz yanlış.');
      } else {
        errorMessage(
            'Giriş bilgilerinizi girdiğinizden ve doğru olduğundan emin olunuz.');
      }
    });
  }

  register(
      BuildContext context,
      TextEditingController usernameController,
      TextEditingController emailController,
      TextEditingController passwordController) {
    Auth().signUpWithEmailAndPassword(
      context: context,
      username: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
