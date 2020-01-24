import 'package:flutter/material.dart';
import 'package:meals/models/filters.dart';
import 'package:provider/provider.dart';

class Filters extends StatelessWidget {
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
          child: Consumer<FiltersModel>(builder: (_, filtersModel, __) {
            return ListView(
              children: <Widget>[
                for (final filter in filtersModel.filters)
                  SwitchListTile(
                    title: Text(filter.title),
                    subtitle: Text(filter.subtitle),
                    value: filter.value,
                    onChanged: (bool value) => filtersModel.setFilter(filter, value),
                  ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
