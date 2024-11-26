import 'dart:convert';
import 'package:http/http.dart';
import '../model/sources_response.dart';

abstract class ApiManager {
  static Future<SourcesResponse> loadTabsList() async {
    try {
      Uri url = Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?apiKey=818a6755c2644116bc0276962bd7a1b4");
      Response response = await get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        SourcesResponse sourcesResponse =
            SourcesResponse.fromJson(jsonDecode(response.body));
        return SourcesResponse();
      } else {
        throw "Something went Wrong";
      }
    } catch (e) {
      rethrow;
    }
  }
}
