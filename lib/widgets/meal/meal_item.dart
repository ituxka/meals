import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/utils/extensions/enum_to_string.dart';

class MealItem extends StatelessWidget {
  MealItem(this.meal);

  final Meal meal;

  void onMealSelect(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealDetailScreen.routeName,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onMealSelect(context),
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: <Widget>[
            imageWithCaption(meal.imageUrl, meal.title),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  mealDescriptionDetail(Icons.schedule, '${meal.duration} min'),
                  mealDescriptionDetail(Icons.work, meal.complexity.toShortString()),
                  mealDescriptionDetail(Icons.attach_money, meal.affordability.toShortString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

typedef Widget ImageDecorationFn(String url);

Widget image(String url) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
    child: Container(
      height: 250,
      child: Image.network(
        url,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent event) {
          if (event == null) return child;
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Theme.of(context).primaryColor,
              ),
              value: event.expectedTotalBytes != null
                  ? event.cumulativeBytesLoaded / event.expectedTotalBytes
                  : null,
            ),
          );
        },
      ),
    ),
  );
}

Stack imageWithCaption(String imageUrl, String caption) {
  return Stack(
    children: <Widget>[
      image(imageUrl),
      Positioned(
        bottom: 20,
        right: 10,
        child: Container(
          width: 300,
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Text(
              caption,
              style: TextStyle(fontSize: 26, color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget mealDescriptionDetail(IconData icon, String text) {
  return Row(
    children: <Widget>[
      Icon(icon),
      SizedBox(width: 6),
      Text(text),
    ],
  );
}
