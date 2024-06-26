import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class HomePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const AppSearchBar(),
      actions: [
        AppActionsButton(
          icon: Icons.language_outlined,
          onPressed: () {},
          backgroundColor: AppColors.neutral.shade200,
        ),
        AppActionsButton(
          icon: Icons.notifications_none_outlined,
          onPressed: () {},
        ),
      ],
      backgroundColor: AppColors.quaterniary,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 70);
}
