import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meno_shop/app/app.dart' show AppCubit;
import 'package:meno_shop/cart/cart.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/favorites/favorites.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/navigation/navigation.dart';
import 'package:meno_shop/profile/profile.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.quaterniary,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (AppCubit cubit) => cubit.state.tabIndex,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: const AppTheme().themeData,
      home: SafeArea(
        child: Scaffold(
          body: IndexedStack(
            index: selectedTab,
            children: const [
              HomePage(),
              CategoriesPage(),
              CartPage(),
              FavoritesPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: BottomNavBar(
            currentIndex: selectedTab,
            onTap: (value) => context.read<AppCubit>().setTab(value),
          ),
        ),
      ),
    );
  }
}
