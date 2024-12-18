import 'source.dart';

class SourcesResponse {
  String? _status;
  List<Source>? _sources;
  String? code;
  String? message;

  SourcesResponse({
    String? status,
    List<Source>? sources,
    this.code,
    this.message
  }) {
    _status = status;
    _sources = sources;
  }

  SourcesResponse.fromJson(dynamic json) {
    _status = json['status'];
    message=json['message'];
    code=json['code'];
    if (json['sources'] != null) {
      _sources = [];
      json['sources'].forEach((v) {
        _sources!.add(Source.fromJson(v));
      });
    }
  }

  String? get status => _status;

  List<Source>? get sources => _sources;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['sources'] = _sources?.map((v) => v.toJson()).toList();
    return map;
  }
}
