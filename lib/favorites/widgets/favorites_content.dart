import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/favorites/favorites.dart';

class FavoritesContent extends StatelessWidget {
  const FavoritesContent({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites =
        context.select((FavoritesBloc bloc) => bloc.state.products);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //TODO: Replace with actual functionality for product items
        const SizedBox(height: AppSpacing.xlg),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 160 / 285,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            padding: EdgeInsets.zero,
            children: favorites
                .map(
                  (e) => AppProductItem(
                    onTap: () {},
                    image: e.photo?.first.path,
                    price: e.price!,
                    label: e.name!,
                    onFavoriteAdded: () {},
                  ),
                )
                .toList(),
            // [
            //   //TODO: Replace with actual product items
            //   AppProductItem(
            //     image: Assets.images.jeans.path,
            //     price: 550,
            //     label: 'T-Shirt',
            //     onTap: () {},
            //   ),
            //   AppProductItem(
            //     image: Assets.images.jeans.path,
            //     price: 550,
            //     label: 'T-Shirt',
            //     onTap: () {},
            //   ),
            // ],
          ),
        ),
      ],
    ).paddingOnly(left: 10);
  }
}
