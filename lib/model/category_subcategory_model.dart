List<Category> categoriesModeFromJson(List<Map<String, dynamic>> list) {
  return List<Category>.from(list.map((x) => Category.fromJson(x)));
}

//<<<<<Category_Model>>>>>//
class Category {
  String categoryName;
  bool isChecked;
  bool isVisible;
  List<SubCategory> subCategories;

  Category({
    required this.categoryName,
    required this.subCategories,
    this.isChecked = false,
    this.isVisible = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    List<String> subCategories =
        List<String>.from(json["concepts"].map((x) => x));

    return Category(
      categoryName: json['topicName'],
      subCategories: List.generate(
        subCategories.length,
        (index) => SubCategory(
          name: subCategories[index],
        ),
      ),
    );
  }
}

//<<<<<Subcategory_Model>>>>>//
class SubCategory {
  String name;
  bool isChecked;

  SubCategory({
    required this.name,
    this.isChecked = false,
  });
}

List<Category> checkboxList = [
  Category(
    categoryName: "Sports",
    subCategories: [
      SubCategory(
        name: "Football",
      ),
      SubCategory(
        name: "Cricket",
      ),
    ],
  ),
  Category(
    categoryName: "Programming Languages",
    subCategories: [
      SubCategory(
        name: "Javascript",
      ),
      SubCategory(
        name: "Java",
      ),
    ],
  )
];
