
import 'package:qiita_search_app/models/user.dart';

class Article {
  Article({
    required this.title,
    required this.user,
    this.likeCount = 0,
    this.tags = const [],
    required this.createdAt,
    required this.url
  });

  final String title;
  final User user;
  final int likeCount;
  final List<String> tags;
  final DateTime createdAt;
  final String url;

  factory Article.fromJson(dynamic json) {
    return Article(
      title: json['title'] as String,
      user: User.fromJson(json['user']),
      url: json['url'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      likeCount: json['like_count'] as int,
      tags: List<String>.from(json['tags'].map((tag) => tag['name'])), // List<String>.from()を使ってList<String>に変換
    );
  }
}