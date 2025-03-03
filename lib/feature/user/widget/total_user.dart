import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_test/feature/user/bloc/user_bloc.dart';
import 'package:onr_ui/onr_ui.dart';

class TotalUser extends StatelessWidget {
  const TotalUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: AppSpacing.lg,
                ),
                state.listUser.isNotEmpty
                    ? Row(
                        children: [
                          Text(
                            'Total de usuario: ',
                            style: UITextStyle.titles.title2Medium,
                          ),
                          Text(
                            state.listUser.length.toString(),
                            style: UITextStyle.labels.label,
                          ),
                        ],
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
                SizedBox(
                  height: AppSpacing.lg,
                ),
                AppButton.primary(
                  title: 'cerrar',
                  onPressed: () {
                    context.pop();
                  },
                ),
                SizedBox(
                  height: AppSpacing.lg,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
