//
//<<<<<Category_Model>>>>>//
class Topic {
  String topicName;
  bool isChecked;
  bool isVisible;
  List<Concepts> concepts;

  Topic({
    required this.topicName,
    required this.concepts,
    this.isChecked = false,
    this.isVisible = false,
  });

  factory Topic.fromJson(Map<String, dynamic> json) {
    List<String> allConcepts =
        List<String>.from(json["concepts"].map((x) => x));

    return Topic(
      topicName: json['topicName'],
      concepts: List.generate(
        allConcepts.length,
        (index) => Concepts(
          name: allConcepts[index],
        ),
      ),
    );
  }
}

List<Topic> categoriesModelFromJson(List list) {
  return List<Topic>.from(list.map((x) => Topic.fromJson(x)));
}

//<<<<<Subcategory_Model>>>>>//
class Concepts {
  String name;
  bool isChecked;

  Concepts({
    required this.name,
    this.isChecked = false,
  });
}
