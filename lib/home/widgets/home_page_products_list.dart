// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/product/product.dart';

class HomePageProductsList extends StatelessWidget {
  const HomePageProductsList({
    super.key,
    required this.products,
    required this.title,
  });

  final List<ProductItem?>? products;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final locale = context.l10n.localeName;
    // final cartBloc = context.read<CartBloc>();
    final favoriteBloc = context.read<FavoritesBloc>();
    return SliverToBoxAdapter(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTitledWithViewAllRow(
            title: title ?? '',
            padding: 10,
            onViewAllTap: () => context.pushNamed(
              RouteNames.categoryProducts.name,
            ),
            viewAllText: context.l10n.viewAll,
          ),
          const SizedBox(height: AppSpacing.md),
          if (products != null)
            AppHorizontalListView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: products!.length,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                var product = products![index];

                if (products!.isNotEmpty && product != null) {
                  return AppProductItem(
                    onFavoriteAdded: () =>
                        favoriteBloc.add(FavoriteButtonPressed(product.uuid!)),
                    //TODO: Cart Add function
                    onCartAdded: () {},
                    photoPath:
                        product.photo != null && product.photo!.isNotEmpty
                            ? product.photo!.first.path!.fullPath()
                            : null,
                    name: product.name!.changeLocale(locale),
                    price: product.price!,
                    originalPrice: product.discounts?.originalPrice,
                    isFavorite: favoriteBloc.isFavorite(product.uuid!),
                    //TODO: Advantages
                    advantages: null,
                    onProductPressed: () {
                      context.read<ProductsBloc>().add(
                          ProductByUuidRequested(productUuid: product.uuid!));
                      context.pushNamed(
                        RouteNames.productDetails.name,
                        pathParameters: {'uuid': product.uuid!},
                      );
                    },
                  );
                }
                return const SizedBox(
                  child: Text('No available products'),
                ).centralize();
              },
            )
          else
            const Padding(padding: EdgeInsets.zero),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
