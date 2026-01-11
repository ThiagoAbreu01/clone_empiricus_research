
class NewsModel {
  final String siteName;
  final String description;
  final String imageSite;
  final String imageNews;

  NewsModel({
    required this.siteName,
    required this.description,
    required this.imageSite,
    required this.imageNews,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      siteName: json['site_name'] as String,
      description: json['description'] as String,
      imageSite: json['image_site'] as String,
      imageNews: json['image_news'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'site_name': siteName,
      'description': description,
      'image_site': imageSite,
      'image_news': imageNews,
    };
  }
}