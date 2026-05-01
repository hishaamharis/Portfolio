import 'package:flutter/material.dart';
import 'package:portfolio/theme/app_colors.dart';
import 'package:portfolio/theme/app_motion.dart';
import 'package:portfolio/theme/app_typography.dart';

class HoverableButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String label;
  final Color accent;

  const HoverableButton({
    super.key,
    required this.onPressed,
    this.label = 'View on GitHub',
    this.accent = AppColors.accent,
  });

  @override
  State<HoverableButton> createState() => _HoverableButtonState();
}

class _HoverableButtonState extends State<HoverableButton> {
  bool _hovered = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) {
          setState(() => _pressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _pressed = false),
        child: AnimatedScale(
          scale: _pressed ? 0.96 : 1.0,
          duration: AppMotion.hover,
          curve: AppMotion.easeOut,
          child: AnimatedContainer(
            duration: AppMotion.hover,
            curve: AppMotion.easeOut,
            padding:
                const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: BoxDecoration(
              color: _hovered ? widget.accent : Colors.transparent,
              border: Border.all(color: widget.accent, width: 1),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.label.toUpperCase(),
                  style: AppType.mono(
                    size: 12,
                    color: _hovered ? AppColors.ink : widget.accent,
                    letterSpacing: 1.6,
                    weight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.arrow_outward,
                  size: 16,
                  color: _hovered ? AppColors.ink : widget.accent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
