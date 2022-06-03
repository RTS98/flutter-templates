import 'package:dio/dio.dart';
import 'package:news_app/models/article_response.dart';
import 'package:news_app/models/source_response.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "79d8d218f0f74cfa947f481fa20d9b1f";
  final Dio _dio = Dio();

  final getTopHeadlineUrl = "$mainUrl/top-headlines";
  final getSourcesUrl = '$mainUrl/sources';

  Future<ArticleResponse> getTopHeadlines() async {
    var params = {"apiKey": apiKey, "country": "us"};

    try {
      Response response =
        await _dio.get(getTopHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }

  Future<SourceResponse> getSources() async {
    var params = {
      "apiKey": apiKey,
      "language" : "en",
      "country" : "us"
    };

    try{
      Response response = await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    }catch(error, stacktrace){
      print("Exception occured: $error stackTrace: $stacktrace");
      return SourceResponse.withError("$error");
    }
  }

  Future<ArticleResponse> getSourceNews(String sourceId) async {
    var params = {
      "apiKey": apiKey,
      "sources" : sourceId};
    try {
      Response response = await _dio.get(getTopHeadlineUrl, queryParameters: params);
      return ArticleResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleResponse.withError("$error");
    }
  }
}
