class WasteBin {
  final String id;
  final String name;
  final String type; // Organic, Recyclable, Hazardous
  int level; // percentage (0–100)
  DateTime updatedAt;

  WasteBin({
    required this.id,
    required this.name,
    required this.type,
    required this.level,
    DateTime? updatedAt,
  }) : updatedAt = updatedAt ?? DateTime.now();
}
