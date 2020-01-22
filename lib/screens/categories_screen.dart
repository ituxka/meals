import 'package:flutter/material.dart';
import 'package:meals/widgets/category/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MealsApp'),
      ),
      body: CategoriesList(),
    );
  }
}
