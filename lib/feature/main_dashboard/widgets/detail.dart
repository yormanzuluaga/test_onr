import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onr_test/app/utils/format_helpers.dart';
import 'package:onr_test/feature/main_dashboard/bloc/product_bloc.dart';
import 'package:onr_ui/onr_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onr_test/app/routes/routes_names.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.go(RoutesNames.home);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Producto',
          style: UITextStyle.titles.title3Medium,
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          return state.product != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: AppSpacing.lg,
                      ),
                      Text(
                        state.product!.title.toString(),
                        style: UITextStyle.titles.title2Medium,
                      ),
                      SizedBox(
                        height: AppSpacing.lg,
                      ),
                      Text(
                        'descripción: ${state.product!.description}',
                        style: UITextStyle.labels.label,
                      ),
                      SizedBox(
                        height: AppSpacing.lg,
                      ),
                      Text(
                        'Precio: ${AppFormatters.instance.formatterMoney(state.product!.price!)}',
                        style: UITextStyle.labels.label,
                      ),
                      SizedBox(
                        height: AppSpacing.lg,
                      ),
                      Text(
                        'Categoria: ${state.product!.category}',
                        style: UITextStyle.labels.label,
                      ),
                      SizedBox(
                        height: AppSpacing.lg,
                      ),
                      ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        child: Image.network(
                          state.product!.image.toString(),
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 300,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: Center(
                                child: Icon(Icons.broken_image, size: 50),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: AppSpacing.lg,
                      ),
                      Text(
                        'Rating: ${state.product!.rating?.count}',
                        style: UITextStyle.labels.label,
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}
