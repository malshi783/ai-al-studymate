import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ai_al_studymate/core/theme/theme_controller.dart';
import 'package:ai_al_studymate/widgets/bottom_glass_nav.dart';
import 'package:ai_al_studymate/widgets/subject_tag.dart';

void main() {
  test('theme controller supports system, light, and dark modes', () {
    final controller = ThemeController();
    expect(controller.themeMode, ThemeMode.system);

    controller.toggleDarkMode(true);
    expect(controller.themeMode, ThemeMode.dark);

    controller.toggleDarkMode(false);
    expect(controller.themeMode, ThemeMode.light);
  });

  testWidgets('bottom navigation contains existing app destinations', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          bottomNavigationBar: BottomGlassNav(selectedIndex: 0, onTap: (_) {}),
        ),
      ),
    );

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Tasks'), findsOneWidget);
    expect(find.text('Papers'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('subject tag renders for existing subject screens', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const Scaffold(body: SubjectTag(subject: 'Accounting')),
      ),
    );

    expect(find.text('Accounting'), findsOneWidget);
  });
}
