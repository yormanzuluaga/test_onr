import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_test/feature/user/bloc/user_bloc.dart';
import 'package:onr_ui/onr_ui.dart';

class UserMobile extends StatefulWidget {
  const UserMobile({super.key});

  @override
  _UserMobileState createState() => _UserMobileState();
}

class _UserMobileState extends State<UserMobile> {
  @override
  void initState() {
    context.read<UserBloc>().add(GetUserEvent());
    context.read<UserBloc>().add(TotalUserEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Column(
          children: [
            Text(
              'Usuarios',
              style: UITextStyle.titles.title2Medium,
            ),
            SizedBox(
              height: AppSpacing.md,
            ),
            state.listUser.isNotEmpty
                ? Flexible(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: state.listUser.length,
                      itemBuilder: (context, index) {
                        final data = state.listUser[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: BaseCard(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Text(
                                  '${data.name?.firstname} ${data.name?.lastname}',
                                  style: UITextStyle.titles.title2Medium,
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Text(
                                  'Usuario: ${data.username}',
                                  style: UITextStyle.labels.label,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Text(
                                  'Email: ${data.email}',
                                  style: UITextStyle.labels.label,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Text(
                                  'Dirección: ${data.address?.street} ${data.address?.number}',
                                  style: UITextStyle.labels.label,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                                Text(
                                  'Teléfono: ${data.phone}',
                                  style: UITextStyle.labels.label,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: AppSpacing.lg,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        );
      },
    );
  }
}
