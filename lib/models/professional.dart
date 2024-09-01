class Professional {
  final String id;
  final String name;
  final String specialty;
  final double rating;
  final String description;

  Professional({
    required this.id,
    required this.name,
    required this.specialty,
    required this.rating,
    required this.description,

  });

  @override
  String toString() {
    return 'Professional(id: $id, name: $name, specialty: $specialty, rating: $rating, description: $description)';
  }
}
