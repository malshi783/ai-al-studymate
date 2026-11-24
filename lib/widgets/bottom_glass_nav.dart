import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class BottomGlassNav extends StatelessWidget {
  const BottomGlassNav({
    required this.selectedIndex,
    required this.onTap,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    (Icons.home_outlined, 'Home'),
    (Icons.check_box_outlined, 'Tasks'),
    (Icons.description_outlined, 'Papers'),
    (Icons.person_outline, 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ClipRRect(
      borderRadius: BorderRadius.circular(36),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          height: 76,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: isDark
                ? const Color(0xDD102329)
                : Colors.white.withValues(alpha: 0.94),
            borderRadius: BorderRadius.circular(36),
            border: Border.all(
              color: isDark
                  ? AppColors.glassBorder
                  : AppColors.maroon.withValues(alpha: 0.12),
            ),
          ),
          child: Row(
            children: List.generate(_items.length, (index) {
              final selected = selectedIndex == index;
              final item = _items[index];

              return Expanded(
                child: Semantics(
                  button: true,
                  selected: selected,
                  label: item.$2,
                  child: InkWell(
                    onTap: () => onTap(index),
                    borderRadius: BorderRadius.circular(28),
                    child: SizedBox(
                      height: 56,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            item.$1,
                            size: 23,
                            color: selected
                                ? AppColors.primary
                                : (isDark
                                      ? AppColors.muted
                                      : AppColors.lightMuted),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item.$2,
                            style: TextStyle(
                              fontSize: 10,
                              color: selected
                                  ? AppColors.primary
                                  : (isDark
                                        ? AppColors.muted
                                        : AppColors.lightMuted),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
