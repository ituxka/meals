import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/stub/stub_categories.dart';
import 'package:meals/widgets/category/category_item.dart';

void main() {
  testWidgets('renders categories_screen', (WidgetTester tester) async {
    final widget = MaterialApp(
      home: CategoriesScreen(),
    );
    await tester.pumpWidget(widget);

    expect(find.byWidget(widget), findsOneWidget);
  });

  testWidgets('renders exactly STUB_CATEGORIES.length widgets', (WidgetTester tester) async {
    final widget = MaterialApp(
      home: CategoriesScreen(),
    );
    await tester.pumpWidget(widget);

    expect(find.byType(CategoryItem), findsNWidgets(STUB_CATEGORIES.length));
  });
}
