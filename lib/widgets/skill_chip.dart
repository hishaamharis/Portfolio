import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';

class SkillChip extends StatefulWidget {
  final String label;
  final bool primary;

  const SkillChip({
    super.key,
    required this.label,
    this.primary = false,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color borderColor = _hovered
        ? AppColors.accent
        : (widget.primary ? AppColors.accent : AppColors.border);
    final Color textColor = _hovered
        ? AppColors.accent
        : (widget.primary ? AppColors.accent : AppColors.bone);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppMotion.hover,
        curve: AppMotion.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.ink,
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Text(
          widget.label.toLowerCase(),
          style: AppType.mono(
            size: 12,
            color: textColor,
            letterSpacing: 0.6,
          ),
        ),
      ),
    );
  }
}
