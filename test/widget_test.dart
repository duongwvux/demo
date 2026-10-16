import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prj2/main.dart';

void main() {
  testWidgets('uses English core localizations by default', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Sample'), findsOneWidget);
  });

  testWidgets('loads Vietnamese core localizations', (tester) async {
    await tester.pumpWidget(const MyApp(locale: Locale('vi')));

    expect(find.text('Trang chủ'), findsOneWidget);
    expect(find.text('Mẫu'), findsOneWidget);
  });
}
