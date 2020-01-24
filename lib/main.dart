import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/style.dart';
import 'package:provider/provider.dart';

import 'models/filters.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FiltersModel()),
        ProxyProvider<FiltersModel, MealsModel>(
          update: (_, filtersModel, __) => MealsModel(filtersModel.filters),
        ),
      ],
      child: MaterialApp(
        title: 'Meals App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: bgColor,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                body2: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                title: titleStyle,
              ),
        ),
        routes: {
          '/': (_) => TabsScreen(),
          CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (_) => MealDetailScreen(),
          FiltersScreen.routeName: (_) => FiltersScreen(),
        },
      ),
    );
  }
}
