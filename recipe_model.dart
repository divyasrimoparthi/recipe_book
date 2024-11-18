class Recipe {
  final String title;
  final String image;
  final String description;

  Recipe({required this.title, required this.image, required this.description});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recipe &&
        other.title == title &&
        other.image == image &&
        other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ image.hashCode ^ description.hashCode;
}
