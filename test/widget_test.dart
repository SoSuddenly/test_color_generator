import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_color_generator/main_screen.dart';

void main() {
  testWidgets('Color change test', (WidgetTester tester) async {
    //trigger a frame.
    await tester.pumpWidget(const MainScreen());

    const int testsCounts = 16777216;
    //number of taps
    for (int i = 0; i < testsCounts; i++) {
      await tester.tap(find.byType(ColoredBox));
    }

    // try to catch our random but if we cant so be it :)
    const expectedBackgroundColor = Colors.black;

    // Check if the background color has indeed changed.
    expect(
      tester.widget<ColoredBox>(find.byType(ColoredBox)).color,
      expectedBackgroundColor,
    );
  });
}
