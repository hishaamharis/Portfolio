import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';

class HoverableTechContainer extends StatefulWidget {
  final String tech;
  final Color accent;

  const HoverableTechContainer({
    super.key,
    required this.tech,
    this.accent = AppColors.accent,
  });

  @override
  State<HoverableTechContainer> createState() => _HoverableTechContainerState();
}

class _HoverableTechContainerState extends State<HoverableTechContainer> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color color = _hovered ? widget.accent : AppColors.mute;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppMotion.hover,
        curve: AppMotion.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: color.withOpacity(_hovered ? 1 : 0.4)),
        ),
        child: Text(
          widget.tech.toLowerCase(),
          style: AppType.mono(size: 12, color: color, letterSpacing: 0.4),
        ),
      ),
    );
  }
}
