import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/l10n/l10n.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final carts = context.select((CartBloc bloc) => bloc.state.cart);
    return CartContent(carts: carts);
  }
}

class OrderInformationView extends StatelessWidget {
  const OrderInformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.quaterniary,
      appBar: AppBar(
        title: const Text(
          'Order Information',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            AppRadioButton(
              text: context.l10n.paymentMethod,
              values: [
                context.l10n.paymentMethodCash,
                context.l10n.paymentMethodTerminal,
              ],
            ),
            AppRadioButton(
              text: context.l10n.deliveryTime,
              values: const [
                '09:00 - 13:00',
                '13:00 - 17:00',
                '17:00 - 21:00',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
