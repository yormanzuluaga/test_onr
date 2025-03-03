// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_test/feature/auth/bloc/auth_bloc.dart';
import 'package:onr_ui/onr_ui.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({super.key});

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  String email = '';
  final emailRegex = RegExp(
    r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
  );
  final RegExp passwordUpperCase = RegExp('[A-Z]');
  final RegExp passwordMayu = RegExp('[A-Za-z]');
  final RegExp passwordNum = RegExp('[0-9]');
  final RegExp specialCharacters = RegExp(r'[^a-zA-Z\d]');
  final formKey = GlobalKey<FormState>();

  bool isVisible = false;
  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: AppSpacing.xlg,
            ),
            Text(
              'LOG IN',
              style: UITextStyle.labels.label.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            AppTextField(
              controller: controllerEmail,
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo requerido";
                } else if (!emailRegex.hasMatch(value)) {
                  return "Introduzca un correo válido.";
                }
                return null;
              },
              hintText: 'Email',
            ),
            const SizedBox(
              height: AppSpacing.lg,
            ),
            AppTextField(
              suffixIcon: showPassword ? Icons.visibility_off : Icons.visibility,
              tapSuffixIcon: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              controller: controllerPassword,
              validator: (value) {
                if (value.isEmpty) {
                  return "Campo requerido";
                } else if (!passwordUpperCase.hasMatch(value)) {
                  return "Una letra mayúscula";
                } else if (!passwordNum.hasMatch(value)) {
                  return "Un número";
                }
                return null;
              },
              hintText: 'Password',
              autoFillHints: const [AutofillHints.password],
              isObscureText: showPassword,
            ),
            const SizedBox(
              height: 52,
            ),
            !isVisible
                ? SizedBox(
                    width: double.infinity,
                    child: AppButton.primary(
                      title: 'LOG IN',
                      onPressed: () {
                        formKey.currentState!.validate();
                        if (controllerEmail.text.isNotEmpty &&
                            controllerPassword.text.isNotEmpty &&
                            passwordUpperCase.hasMatch(controllerPassword.text) &&
                            passwordNum.hasMatch(controllerPassword.text)) {
                          setState(() {
                            isVisible = true;
                          });
                          context.read<AuthBloc>().add(LoginEvent(token: 'token'));
                        }
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(
                        text: '¿No tienes una cuenta? ',
                        style: UITextStyle.links.link.copyWith(color: AppColors.white),
                      ),
                      TextSpan(
                        text: ' Regístrate ahora.',
                        style: UITextStyle.paragraphs.paragraph2Medium.copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
