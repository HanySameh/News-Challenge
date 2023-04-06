class NewsModel {
  final int id;
  final String title;
  final String status;
  final String description;
  final String authorName;
  final String image;
  final String authorImage;
  final String date;
  final String category;
  final bool isRecommended;
  bool isMark;

  NewsModel({
    required this.id,
    required this.title,
    required this.status,
    required this.description,
    required this.authorName,
    required this.image,
    required this.authorImage,
    required this.date,
    required this.category,
    required this.isRecommended,
    this.isMark = false,
  });

  NewsModel copyWith({
    int? id,
    String? title,
    String? status,
    String? description,
    String? authorName,
    String? image,
    String? authorImage,
    String? date,
    String? category,
    bool? isRecommended,
    bool? isMark,
  }) {
    return NewsModel(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      description: description ?? this.description,
      authorName: authorName ?? this.authorName,
      image: image ?? this.image,
      authorImage: authorImage ?? this.authorImage,
      date: date ?? this.date,
      category: category ?? this.category,
      isRecommended: isRecommended ?? this.isRecommended,
      isMark: isMark ?? this.isMark,
    );
  }
}
