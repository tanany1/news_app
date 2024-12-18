import 'article.dart';

class ArticlesResponse {
  ArticlesResponse({
    String? status,
    num? totalResults,
    List<Article>? articles,
    this.message,
    this.code,
  }) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  ArticlesResponse.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    message = json['message'];
    code = json['code'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Article.fromJson(v));
      });
    }
  }

  String? _status;
  num? _totalResults;
  List<Article>? _articles;
  String? code;
  String? message;

  String? get status => _status;

  num? get totalResults => _totalResults;

  List<Article>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
