import 'package:news_app/model/source.dart';

class Article {
  Article({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  Article.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }

  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Article copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) =>
      Article(
        source: source ?? _source,
        author: author ?? _author,
        title: title ?? _title,
        description: description ?? _description,
        url: url ?? _url,
        urlToImage: urlToImage ?? _urlToImage,
        publishedAt: publishedAt ?? _publishedAt,
        content: content ?? _content,
      );

  Source? get source => _source;
  String? get author => _author;
  String? get title => _title;
  String? get description => _description;
  String? get url => _url;
  String? get urlToImage => _urlToImage;
  String? get publishedAt => _publishedAt;
  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }
}