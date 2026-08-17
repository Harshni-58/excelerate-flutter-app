import 'package:flutter_test/flutter_test.dart';

import 'package:hello_world/main.dart';

void main() {
  testWidgets('navigates through the four core screens', (tester) async {
    await tester.pumpWidget(const ExcelerateApp());

    expect(find.text('Welcome Back!'), findsOneWidget);

    await tester.ensureVisible(find.text('LOGIN'));
    await tester.tap(find.text('LOGIN'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Excelerate!'), findsOneWidget);

    await tester.ensureVisible(find.text('Digital Marketing Bootcamp'));
    await tester.tap(find.text('Digital Marketing Bootcamp'));
    await tester.pumpAndSettle();

    expect(find.text('PROGRAMS'), findsOneWidget);

    final detailsButton = find.text('VIEW DETAILS').first;
    await tester.ensureVisible(detailsButton);
    await tester.tap(detailsButton);
    await tester.pumpAndSettle();

    expect(find.text('PROGRAM DETAILS'), findsOneWidget);
  });
}
