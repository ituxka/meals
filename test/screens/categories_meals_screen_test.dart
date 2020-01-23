import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/category_meals_screen.dart';

void main() {
  testWidgets('renders category_meals_screen with category data', (WidgetTester tester) async {
    final mockCategory = Category(id: 'id1', title: 'Italian');

    final key = GlobalKey<NavigatorState>();
    final widget = MaterialApp(
      navigatorKey: key,
      home: FlatButton(
        onPressed: () => key.currentState.push(
          MaterialPageRoute<void>(
            settings: RouteSettings(arguments: mockCategory),
            builder: (_) => CategoryMealsScreen(),
          ),
        ),
        child: const Text('Button'),
      ),
    );

    await tester.pumpWidget(widget);

    await tester.tap(find.byType(FlatButton));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(AppBar, mockCategory.title), findsOneWidget);
  });
}
