import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_test/app/routes/routes.dart';
import 'package:onr_test/app/utils/format_helpers.dart';
import 'package:onr_test/feature/main_dashboard/bloc/product_bloc.dart';
import 'package:onr_ui/onr_ui.dart';
import 'package:flutter/material.dart';

class MainDashboardMobile extends StatelessWidget {
  MainDashboardMobile({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      child: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return Column(
            children: [
              Text(
                'Productos',
                style: UITextStyle.titles.title2Medium,
              ),
              SizedBox(
                height: AppSpacing.md,
              ),
              state.listProduct.isNotEmpty
                  ? Flexible(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.listProduct.length,
                        itemBuilder: (context, index) {
                          final data = state.listProduct[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: InkWell(
                              onTap: () {
                                context.read<ProductBloc>().add(ProductDetailEvent(id: data.id.toString()));
                                context.go(RoutesNames.detail);
                              },
                              child: BaseCard(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: AppSpacing.lg,
                                    ),
                                    Text(
                                      data.title.toString(),
                                      style: UITextStyle.titles.title2Medium,
                                    ),
                                    SizedBox(
                                      height: AppSpacing.lg,
                                    ),
                                    Text(
                                      'Descripción: ${data.description}',
                                      style: UITextStyle.labels.label,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: AppSpacing.lg,
                                    ),
                                    Text(
                                      'Precio: ${AppFormatters.instance.formatterMoney(data.price!)}',
                                      style: UITextStyle.labels.label,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: AppSpacing.lg,
                                    ),
                                  ],
                                ),
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
      ),
    );
  }

  formatterMoney(double? price) {}
}
