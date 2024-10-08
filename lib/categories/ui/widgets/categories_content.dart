import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:meno_shop/categories/categories.dart';
import 'package:meno_shop/shimmer/shimmer.dart';

class CategoriesContent extends StatelessWidget {
  const CategoriesContent({
    super.key,
    required this.categories,
  });
  final List<CategoryItem> categories;
  @override
  Widget build(BuildContext context) {
    if (categories.isEmpty) {
      return const CategoryLoadingView().paddingSymmetric(horizontal: 5);
    }

    return ListView.builder(
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        // final subcategory = category.subcategories;

        return CategoriesExpansionTile(category: category);
        // if (subcategory!.isEmpty) {
        //   return const SizedBox.shrink();
        // }
        // if (subcategory != [] && subcategory.isNotEmpty) {
        //   return CategoriesExpansionTile(category: category);
        // }
        // return null;
      },
    );
  }
}
