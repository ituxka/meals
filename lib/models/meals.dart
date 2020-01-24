import 'package:meals/models/filters.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/stub/stub_meals.dart';

class MealsModel {
  MealsModel(this._filters);

  final List<Filter> _filters;
  List<Meal> _availableMeals() {
    // for time reasons, i leave it here as is
    return STUB_MEALS.where((meal) {
      if (_filters[0].value && !meal.isGlutenFree) {
        return false;
      }

      if (_filters[1].value && !meal.isLactoseFree) {
        return false;
      }

      if (_filters[2].value && !meal.isVegan) {
        return false;
      }

      if (_filters[3].value && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
  }

  get meals => _availableMeals();
}
