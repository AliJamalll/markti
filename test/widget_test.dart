import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:markti/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // بدل ما تشغل main الحقيقي اللي فيه storage
    // نشغّل الـ app مباشرة بدون storage
    await tester.pumpWidget(MyApp(routeName: '/test'));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsOneWidget);
  });
}
