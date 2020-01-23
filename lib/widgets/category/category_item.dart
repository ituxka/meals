import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.id, this.title, this.color);

  final String id;
  final String title;
  final Color color;

  void _onSelectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: Category(id: id, title: title, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: categoryItemBorderRadius,
      onTap: () => _onSelectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: categoryItemDecoration(color),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}

final BorderRadius categoryItemBorderRadius = BorderRadius.circular(15);

typedef BoxDecoration CategoryItemDecorationFn(Color color);

CategoryItemDecorationFn categoryItemDecoration = (Color color) {
  return BoxDecoration(
    gradient: LinearGradient(
      colors: [
        color.withOpacity(0.7),
        color,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: categoryItemBorderRadius,
  );
};
