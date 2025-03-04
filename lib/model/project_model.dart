class Project {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> techStack; // Ensure this is a List<String>
  final String? githubUrl;

  Project({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.techStack, // List of technologies
    this.githubUrl,
  });
}