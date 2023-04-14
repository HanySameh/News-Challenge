import 'package:equatable/equatable.dart';

import 'source.dart';

class NewsModel extends Equatable {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  bool isBookmarked = false;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
      'isBookmarked': isBookmarked,
    };
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        source: Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String? ?? 'CNN Indonesia',
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
        url: json['url'] as String? ?? '',
        urlToImage: json['urlToImage'] as String? ?? '',
        publishedAt: json['publishedAt'] as String? ?? '',
        content: json['content'] as String? ?? '',
      );

  @override
  List<Object?> get props {
    return [
      source,
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      isBookmarked,
    ];
  }
}
