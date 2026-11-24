import 'dart:ui';

import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = 22,
    this.blur = 14,
    this.margin,
    this.onTap,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final double blur;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final radius = BorderRadius.circular(borderRadius);

    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: radius,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Material(
            color: isDark
                ? AppColors.glassFill
                : Colors.white.withValues(alpha: 0.82),
            child: InkWell(
              onTap: onTap,
              borderRadius: radius,
              child: Container(
                padding: padding,
                decoration: BoxDecoration(
                  borderRadius: radius,
                  border: Border.all(
                    color: isDark
                        ? AppColors.glassBorder
                        : AppColors.maroon.withValues(alpha: 0.10),
                  ),
                ),
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
