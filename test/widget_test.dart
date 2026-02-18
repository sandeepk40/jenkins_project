import 'package:demo_project/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App loads', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('CI/CD Demo'), findsOneWidget);
  });
}
