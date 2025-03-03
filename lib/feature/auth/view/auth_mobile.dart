import 'package:flutter/material.dart';
import 'package:onr_test/feature/auth/widget/sign_in_widget.dart';
import 'package:onr_ui/onr_ui.dart';

class AuthMobile extends StatelessWidget {
  const AuthMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          SizedBox(
            height: AppSpacing.spaceUnitPlus3,
          ),
          Text(
            'ORN',
            style: UITextStyle.titles.title2Medium.copyWith(
              color: AppColors.white,
            ),
          ),
          SignInWidget(),
        ],
      ),
    );
  }
}
