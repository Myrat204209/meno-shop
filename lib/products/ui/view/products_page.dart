// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meno_shop/products/products.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    super.key,
    // required this.subcategoryName,
    // required this.categoryName,
    required this.subcategoryId,
  });
  // final String subcategoryName;
  // final String categoryName;
  final String subcategoryId;
  @override
  Widget build(BuildContext context) {
    final productRepository = context.read<ProductRepository>();
    return BlocProvider(
      create: (context) => ProductsBloc(productRepository: productRepository),
      child: ProductsView(
        subcategoryId: subcategoryId,

        // category: categoryName,
        // subcategory: subcategoryName,
      ),
    );
  }
}
