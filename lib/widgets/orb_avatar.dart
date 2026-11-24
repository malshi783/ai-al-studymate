import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class OrbAvatar extends StatelessWidget {
  const OrbAvatar({this.size = 64, this.showRings = false, super.key});

  final double size;
  final bool showRings;

  @override
  Widget build(BuildContext context) {
    final orb = Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment(-0.35, -0.45),
          radius: 0.9,
          colors: [
            Color(0xFFB5FFE9),
            AppColors.highlight,
            AppColors.primary,
            Color(0xFF168C79),
          ],
          stops: [0, 0.28, 0.72, 1],
        ),
        boxShadow: [
          BoxShadow(color: Color(0x552DD4A8), blurRadius: 28, spreadRadius: 2),
        ],
      ),
    );

    if (!showRings) return orb;

    return SizedBox(
      width: size * 1.55,
      height: size * 1.55,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: size * 1.48,
            height: size * 1.48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.18),
              ),
            ),
          ),
          Container(
            width: size * 1.22,
            height: size * 1.22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.24),
              ),
            ),
          ),
          orb,
        ],
      ),
    );
  }
}
