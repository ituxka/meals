import 'package:flutter/material.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegan = false;
  var _isVegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              SwitchListTile(
                title: Text('Gluten-free'),
                subtitle: Text('Only include gluten-free meals.'),
                value: _isGlutenFree,
                onChanged: (bool value) => setState(() => _isGlutenFree = value),
              ),
              SwitchListTile(
                title: Text('Lactose-free'),
                subtitle: Text('Only include gluten-free meals.'),
                value: _isLactoseFree,
                onChanged: (bool value) => setState(() => _isLactoseFree = value),
              ),
              SwitchListTile(
                title: Text('Vegan'),
                subtitle: Text('Only include vegan meals.'),
                value: _isVegan,
                onChanged: (bool value) => setState(() => _isVegan = value),
              ),
              SwitchListTile(
                title: Text('Vegetarian'),
                subtitle: Text('Only include vegeterian meals.'),
                value: _isVegetarian,
                onChanged: (bool value) => setState(() => _isVegetarian = value),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
