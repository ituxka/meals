import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.title, this.color);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: categoryItemDecoration(color),
      child: Text(title),
    );
  }
}

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
      borderRadius: BorderRadius.circular(15));
};
