import 'package:flutter/material.dart';
import 'package:onr_ui/onr_ui.dart';

class AuthDesktop extends StatelessWidget {
  const AuthDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45,
            ),
            Text(
              'Pase de guardia',
              style: UITextStyle.titles.title2Medium.copyWith(
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 227,
            ),
            SizedBox(
              width: 416,
              child: AppButton.primary(
                title: 'Ingresar con Microsoft',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
