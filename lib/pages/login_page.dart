import 'dart:ui';

import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          "login Page",
          style: TextStyle(
              fontSize: 22.2, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
