// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/constants/constants.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    super.key,
    required this.cart,
  });
  final CartItem cart;

  @override
  Widget build(BuildContext context) {
    final cartQuantity =
        context.select((CartBloc bloc) => bloc.showQuantity(cart.uuid));
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 324 / 81,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 80,
              child: AspectRatio(
                aspectRatio: 1,
                child: AppImage(
                  imageUrl: cart.photoPath.fullPath(),
                  fit: BoxFit.cover,
                ).clipper(10),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    context.l10n.localeName == 'tk' ? cart.nameTk : cart.nameRu,
                    overflow: TextOverflow.ellipsis,
                    style: const AppTextStyle.text().lg().semiBold(),
                  ),
                  if (cart.size != '')
                    Text(
                      'Size: ${cart.size} ',
                      style: const AppTextStyle.text()
                          .xs()
                          .regular()
                          .withColor(AppColors.neutral.shade700),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    '${cart.price} TMT',
                    style: const AppTextStyle.text().md().semiBold(),
                  ),
                ],
              ),
            ),
            CartCounter(
              addOneButton: () {
                context
                  ..read<CartBloc>()
                      .add(CartCurrentItemCreated(uuid: cart.uuid))
                  ..read<CartBloc>()
                      .add(const CartItemOneUpdated(isForAdding: true));
              },
              removeOneButton: () {
                context
                  ..read<CartBloc>()
                      .add(CartCurrentItemCreated(uuid: cart.uuid))
                  ..read<CartBloc>()
                      .add(const CartItemOneUpdated(isForAdding: false));
              },
              counterQuantity: cartQuantity,
            ),
          ],
        ),
      ),
    );
  }
}
