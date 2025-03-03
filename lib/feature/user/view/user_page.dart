import 'package:flutter/material.dart';
import 'package:onr_test/feature/user/view/user_desktop.dart';
import 'package:onr_test/feature/user/view/user_mobile.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return MediaQuery.of(context).size.width > 900 ? const UserDesktop() : UserMobile();
      },
    );
  }
}
