import 'package:flutter/material.dart';
import 'package:onr_test/feature/auth/view/auth_desktop.dart';
import 'package:onr_test/feature/auth/view/auth_mobile.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MediaQuery.of(context).size.width > 900 ? const AuthDesktop() : const AuthMobile();
      },
    );
  }
}
