import 'package:flutter/material.dart';

class Project {
  final String name;
  final String subtitle;
  final String description;
  final String imageUrl;
  final List<String> techStack;
  final String? githubUrl;
  final Color accent;
  final String year;
  final String category;

  Project({
    required this.name,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.techStack,
    required this.accent,
    required this.year,
    required this.category,
    this.githubUrl,
  });
}
