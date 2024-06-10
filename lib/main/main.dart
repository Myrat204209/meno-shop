import 'dart:io';

import 'package:meno_shop/banner/banner.dart';
import 'package:meno_shop/main/bootstrap/bootstrap.dart';
import 'package:data_provider/data_provider.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/product/product.dart';
import 'package:flutter/foundation.dart';
import '../app/app.dart';
// import 'package:hive/hive.dart';
// import 'package:meno_shop/addresses/address.dart';
// import 'package:meno_shop/auth/auth.dart';
// import 'package:meno_shop/cart/cart.dart';

void main() {
  bootStrap(({
    required sharedPreferences,
    required exceptionStream,
  }) async {
    /// Constants
    const defaultBaseUrl = 'http://192.168.30.238:3000/api/v1';

    /// Storages
    // const secureStorage = SecureStorage();
    final tokenStorage = InMemoryTokenStorage();

    /// HTTP Client
    final httpClient = Http(
      enableLogger: kDebugMode,
      defaultBaseUrl: defaultBaseUrl,
      tokenProvider: tokenStorage.readToken,
      languageProvider: () async => 'tm',
    );

    /// Only for development
    HttpOverrides.global = MyHttpOverrides();

    /// Banners
    final bannerClient = BannerClient(httpClient: httpClient);
    final bannerRepository = BannerRepository(bannerClient: bannerClient);

    /// Categories
    final categoryClient = CategoryClient(httpClient: httpClient);
    final categoryRepository =
        CategoryRepository(categoryClient: categoryClient);

    /// Products
    final productClient = ProductClient(httpClient: httpClient);
    final productRepository = ProductRepository(productClient: productClient);

    /// Auth
    // final authClient =
    //     AuthClient(httpClient: httpClient, tokenStorage: tokenStorage);
    // final authRepository = AuthRepository(authClient: authClient);

    /// Addresses
    // Hive.registerAdapter(AddressModelAdapter());
    // final userAddressBox =
    //     await Hive.openBox<AddressModel>(HiveBoxKeys.userAddresses);
    // final addressRepository = AddressRepository(userAddressBox: userAddressBox);

    // /// Cart
    // final cartClient = CartClient(httpClient: httpClient);
    // final cartRepository = CartRepository(cartClient: cartClient);

    return App(
      // exceptionStream: exceptionStream,
      bannerRepository: bannerRepository,
      categoryRepository: categoryRepository,
      productRepository: productRepository,
      // authRepository: authRepository,
      // addressRepository: addressRepository,
      // cartRepository: cartRepository,
    );
  });
}

const kDefaultBaseUrl = 'http://192.168.30.238:3000';
