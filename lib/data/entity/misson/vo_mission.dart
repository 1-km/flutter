class Mission {
  late String id;
  late String title;
  late String description;

  Mission({
    required this.id,
    required this.title,
    required this.description,
  });

  Mission.fromMap(Map<String, dynamic>? map) {
    id = map?['id'] ?? '';
    title = map?['title'] ?? '';
    description = map?['description'] ?? '';
  }
}
