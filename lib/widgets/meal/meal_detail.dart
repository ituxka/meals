import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetail extends StatelessWidget {
  MealDetail(this.meal);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          image(meal.imageUrl),
          sectionTitle(context, 'Ingredients'),
          sectionListContainer(child: sectionList(meal.ingredients, ingredientItem)),
          sectionTitle(context, 'Steps'),
          sectionListContainer(child: sectionList(meal.steps, stepItem)),
        ],
      ),
    );
  }
}

Widget image(String imageUrl) {
  return Container(
    height: 300,
    width: double.infinity,
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
    ),
  );
}

Widget sectionTitle(BuildContext context, String title) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      title,
      style: Theme.of(context).textTheme.title,
    ),
  );
}

Widget sectionListContainer({Widget child}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    alignment: Alignment.center,
    height: 150,
    width: 300,
    child: child,
  );
}

typedef Widget BuildItemFn<T>(BuildContext context, T item, int index);
typedef SectionsListFn = ListView Function<T>(List<T> list, BuildItemFn<T> item);

final SectionsListFn sectionList = <T>(List<T> list, BuildItemFn<T> item) {
  return ListView.builder(
    itemBuilder: (BuildContext context, int index) => item(context, list[index], index),
    itemCount: list.length,
  );
};

final BuildItemFn<String> ingredientItem = (BuildContext context, String ingredient, int _) {
  return Card(
    color: Theme.of(context).accentColor,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(ingredient),
    ),
  );
};

final BuildItemFn<String> stepItem = (BuildContext context, String step, int index) {
  return ListTile(
    leading: CircleAvatar(child: Text('# ${index + 1}')),
    title: Text(step),
  );
};
