// ignore_for_file: public_member_api_docs, sort_constructors_first

class ContentsModel {
  final String image;
  final String title;
  ContentsModel({
    required this.image,
    required this.title,
  });

  factory ContentsModel.fromJson(Map<String, dynamic> json) {
    return ContentsModel(
      image: json['image'] as String,
      title: json['title'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
    };
  }
}
