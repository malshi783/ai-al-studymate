import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottom_glass_nav.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  static const _paths = ['/home', '/tasks', '/papers', '/profile'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    var selectedIndex = _paths.indexWhere((path) => location == path);
    if (selectedIndex < 0) selectedIndex = 0;

    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 0, 16, 12),
        child: BottomGlassNav(
          selectedIndex: selectedIndex,
          onTap: (index) => context.go(_paths[index]),
        ),
      ),
    );
  }
}
