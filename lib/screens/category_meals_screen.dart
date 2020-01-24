import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/widgets/meal/meal_list.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final List<Meal> availableMeals = Provider.of<MealsModel>(context).meals;

    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: MealList(categoryMeals),
    );
  }
}
