import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color ;

  const SkillChip({super.key, required this.label, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(color: Colors.white)),
        ],
      ),
      backgroundColor: Color(0xFF365151), 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Color(0xFF99E3DC), width: 1), // Add a border
      ),
    );
  }
}