import 'package:flutter/material.dart';
import 'package:meals/widgets/category/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  static String title = 'Categories';

  @override
  Widget build(BuildContext context) {
    return CategoriesList();
  }
}
