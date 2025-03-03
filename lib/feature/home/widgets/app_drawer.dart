import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_test/feature/auth/bloc/auth_bloc.dart';
import 'package:onr_ui/onr_ui.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          children: [
            SizedBox(
              height: AppSpacing.spaceUnitPlus3,
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Icon(
                    Icons.person,
                    size: 32,
                  ),
                ),
                SizedBox(
                  width: AppSpacing.xlgplus,
                ),
                Text(
                  'Nombre Usuarios',
                  style: UITextStyle.labels.label,
                )
              ],
            ),
            SizedBox(
              height: AppSpacing.lg,
            ),
            Divider(
              indent: 1,
              endIndent: 1,
            ),
            SizedBox(
              height: AppSpacing.xlgplus,
            ),
            InkWell(
              onTap: () {
                context.read<AuthBloc>().add(CloseEvent());
              },
              child: Row(
                children: [
                  Text(
                    'Cerrar sesion',
                    style: UITextStyle.labels.label,
                  ),
                  SizedBox(
                    width: AppSpacing.xlgplus,
                  ),
                  Icon(Icons.exit_to_app_outlined),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
