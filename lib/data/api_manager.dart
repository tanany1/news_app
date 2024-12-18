import 'dart:convert';
import 'package:http/http.dart';
import 'package:news_app/model/articles_response.dart';
import '../model/sources_response.dart';

abstract class ApiManager {
  static const String defaultErrorMessage =
      "Something went wrong, please try again.";
  static const String baseUrl = "https://newsapi.org";
  static const String sourcesEndPoint = "/v2/top-headlines/sources";
  static const String articlesEndPoint = "/v2/everything";
  static const String apiKey = "818a6755c2644116bc0276962bd7a1b4";

  static Future<SourcesResponse> loadTabsList(String categoryId) async {
    try {
      Uri url = Uri.parse("$baseUrl$sourcesEndPoint?apiKey=$apiKey&category=$categoryId");
      Response response = await get(url);
      SourcesResponse sourcesResponse =
          SourcesResponse.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return sourcesResponse;
      } else {
        throw sourcesResponse.message ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<ArticlesResponse> loadArticlesList(String sourceId) async {
    try {
      Uri url = Uri.parse(
          "$baseUrl$articlesEndPoint?apiKey=$apiKey&sources=$sourceId");
      Response apiResponse = await get(url);
      ArticlesResponse articlesResponse =
          ArticlesResponse.fromJson(jsonDecode(apiResponse.body));
      if (apiResponse.statusCode >= 200 && apiResponse.statusCode < 300) {
        return articlesResponse;
      } else {
        throw articlesResponse.message ?? defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }
}
