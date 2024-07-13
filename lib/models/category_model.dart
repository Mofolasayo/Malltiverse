class Category {
  Category({
    required this.name,
    required this.categoryType,
  });

  final String? name;
  final String? categoryType;

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json["name"],
      categoryType: json["category_type"],
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "category_type": categoryType,
      };
}
