import 'dart:async';

import 'package:evalution/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashServices {
  // ignore: non_constant_identifier_names
  void IsLogin(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen())));
  }
}
