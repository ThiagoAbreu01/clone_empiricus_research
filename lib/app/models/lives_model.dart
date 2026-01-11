// ignore_for_file: public_member_api_docs, sort_constructors_first

class LivesModel {
  final DateTime date;
  final String title;
  final String description;
  final String image;
  LivesModel({
    required this.date,
    required this.title,
    required this.description,
    required this.image,
  });

   factory LivesModel.fromJson(Map<String, dynamic> json) {
    return LivesModel(
      date: DateTime.parse(json['date'] as String),
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'title': title,
      'description': description,
      'image': image,
    };
  }
}
