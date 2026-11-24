import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.height = 54,
    this.expand = true,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final double height;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    final button = SizedBox(
      height: height,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).brightness == Brightness.dark
              ? AppColors.primary
              : AppColors.maroon,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          minimumSize: const Size(44, 44),
        ),
        child: isLoading
            ? const SizedBox(
                width: 21,
                height: 21,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 19),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
      ),
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}
