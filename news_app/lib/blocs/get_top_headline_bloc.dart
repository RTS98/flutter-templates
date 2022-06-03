import 'package:news_app/models/article_response.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetTopHeadlineBloc {
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<ArticleResponse> _subject =
      BehaviorSubject<ArticleResponse>();

  Future<void> getHeadlines() async {
    ArticleResponse response = await _repository.getTopHeadlines();
     _subject.sink.add(response);
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleResponse> get subject => _subject;
}
final getTopHeadlinesBloc = GetTopHeadlineBloc();