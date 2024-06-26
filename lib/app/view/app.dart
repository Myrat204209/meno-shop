// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/home/home.dart';
import 'package:meno_shop/language/language.dart';
import 'package:meno_shop/product/product.dart';
import 'package:meno_shop/app/app.dart' show AppView, AppCubit;
import 'package:meno_shop/subcategories/subcategories.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    // required StreamController<Exception> exceptionStream,
    required CategoryRepository categoryRepository,
    required SubcategoryRepository subcategoryRepository,
    required ProductRepository productRepository,
    required BannerRepository bannerRepository,
    // required AuthRepository authRepository,
    // required AddressRepository addressRepository,
    // required CartRepository cartRepository,
  })  : _categoryRepository = categoryRepository,
        _productRepository = productRepository,
        _bannerRepository = bannerRepository,
        _subcategoryRepository = subcategoryRepository;
  // _authRepository = authRepository,
  // _addressRepository = addressRepository,
  // _cartRepository = cartRepository;
  final CategoryRepository _categoryRepository;
  final SubcategoryRepository _subcategoryRepository;
  final ProductRepository _productRepository;
  final BannerRepository _bannerRepository;
  // final AuthRepository _authRepository;
  // final AddressRepository _addressRepository;
  // final CartRepository _cartRepository;

  @override
  Widget build(BuildContext context) {
    final appCubit = AppCubit();
    final languageBloc = LanguageBloc();
    final homeBloc = HomeBloc(
      subcategoryRepository: _subcategoryRepository,
      // productRepository: _productRepository,
      bannerRepository: _bannerRepository,
    )..add(HomeRequested());
    final categoriesBloc =
        CategoriesBloc(categoryRepository: _categoryRepository);
    final subcategoriesBloc =
        SubcategoriesBloc(subcategoryRepository: _subcategoryRepository);
    // final addressBloc = AddressBloc(
    //   addressRepository: _addressRepository,
    // )..add(AddressesRequested());
    // final cartBloc = CartBloc(cartRepository: _cartRepository)
    //   ..add(CartInitRequested());

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _bannerRepository),
        RepositoryProvider.value(value: _categoryRepository),
        RepositoryProvider.value(value: _subcategoryRepository),
        // RepositoryProvider.value(value: _cartRepository),
        RepositoryProvider.value(value: _productRepository),
        // RepositoryProvider.value(value: _authRepository),
        // RepositoryProvider.value(value: _addressRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: categoriesBloc),
          BlocProvider.value(value: subcategoriesBloc),
          // BlocProvider.value(value: addressBloc),
          // BlocProvider.value(value: addressBloc),
          BlocProvider.value(value: languageBloc),
          // BlocProvider.value(value: cartBloc),
          BlocProvider.value(value: appCubit),
          BlocProvider.value(value: homeBloc),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ScreenUtilInit(
              designSize: Size(
                constraints.maxWidth,
                constraints.maxHeight,
              ),
              builder: (context, child) => const AppView(),
            );
          },
        ),
      ),
    );
  }
}
