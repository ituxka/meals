import 'package:flutter_test/flutter_test.dart';
import 'package:meals/screens/home_screen.dart';

void main() {
  testWidgets('renders home_screen', (WidgetTester tester) async {
    final widget = HomeScreen();
    await tester.pumpWidget(widget);

    expect(find.byWidget(widget), findsOneWidget);
  });
}
