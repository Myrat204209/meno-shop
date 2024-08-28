// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';
import 'package:data_provider/data_provider.dart';
import 'package:flutter/material.dart';

class CategoryProductsView extends StatelessWidget {
  const CategoryProductsView({
    super.key,
    required this.category,
    // required this.subcategory,
  });

  final CategoryItem category;
  // final SubcategoryItem subcategory;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${category.name}/subcategory.name'),
        Text(
          'Filter search value',
          style: const AppTextStyle.text()
              .lg()
              .bold()
              .withColor(AppColors.primary),
        ),
        const SizedBox(height: AppSpacing.xlg),
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            scrollDirection: Axis.vertical,
            childAspectRatio: 160 / 285,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            padding: EdgeInsets.zero,
            children: [
              AppProductItem(
                onFavoriteAdded: () {},
                onCartAdded: () {},
                photoPath: null,
                name: '',
                price: 1000,
                originalPrice: 1234,
                isFavorite: true,
                advantages: null,
                onProductPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
