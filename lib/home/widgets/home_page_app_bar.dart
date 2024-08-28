import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meno_shop/app/app.dart';
import 'package:meno_shop/l10n/l10n.dart';
import 'package:meno_shop/language/language.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppSearchBar(
        hintText: context.l10n.searching,
      ),
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.quaterniary,
      actions: [
        AppActionsButton(
          icon: Icons.language,
          onPressed: () => showLanguageSelectBottomSheet(context: context),
          backgroundColor: AppColors.neutral.shade200,
        ),
        AppActionsButton(
          icon: Icons.notifications_none,
          onPressed: () {
            context.goNamed(RouteNames.notifications.name);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}
