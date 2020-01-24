import 'package:flutter/material.dart';

class FiltersModel with ChangeNotifier {
  final List<Filter> _filters = [
    Filter(
      id: 'isGlutenFree',
      title: 'Gluten-free',
      subtitle: 'Only include gluten-free meals.',
      value: true,
    ),
    Filter(
      id: 'isLactoseFree',
      title: 'Lactose-free',
      subtitle: 'Only include lactose-free meals.',
    ),
    Filter(
      id: 'isVegan',
      title: 'Vegan',
      subtitle: 'Only include vegan meals.',
      value: true,
    ),
    Filter(
      id: 'isVegetarian',
      title: 'Vegetarian',
      subtitle: 'Only include vegeterian meals.',
    ),
  ];

  get filters => _filters;

  void setFilter(Filter filter, bool newVal) {
    _filters.firstWhere((f) => f.id == filter.id)..value = newVal;
    notifyListeners();
  }
}

class Filter {
  Filter({
    @required this.id,
    this.value = false,
    @required this.title,
    @required this.subtitle,
  });

  final String id;
  bool value;
  final String title;
  final String subtitle;
}
