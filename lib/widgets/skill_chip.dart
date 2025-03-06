import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SkillChip extends StatefulWidget {
  final String label;
  final SvgPicture? icon;

  const SkillChip({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  _SkillChipState createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool isHoveredOrPressed = false;

  void _updateState(bool newState) {
    setState(() => isHoveredOrPressed = newState);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _updateState(true), // Effect on tap
      onTapUp: (_) => _updateState(false), // Remove effect after tap
      onTapCancel: () => _updateState(false), // Handle tap cancel
      child: MouseRegion(
        onEnter: (_) => _updateState(true),
        onExit: (_) => _updateState(false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isHoveredOrPressed ? Colors.teal.shade600 : const Color(0xFF8CA0C6),
            borderRadius: BorderRadius.circular(20),
            border: isHoveredOrPressed ? Border.all(color: Colors.white, width: 2) : null, 
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 4,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) ...[
                SizedBox(
                  width: 20,
                  height: 20, 
                  child: widget.icon!,
                ),
                const SizedBox(width: 5),
              ],
              Text(widget.label, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
