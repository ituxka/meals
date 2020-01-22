import 'package:flutter/material.dart';
import 'package:meals/stub/stub_categories.dart';
import 'package:meals/widgets/category/category_item.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: STUB_CATEGORIES.map((category) {
        return CategoryItem(category.title, category.color);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
    );
  }
}
