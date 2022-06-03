import 'package:news_app/models/source_response.dart';
import 'package:news_app/repository/news_repository.dart';
import 'package:rxdart/rxdart.dart';

class GetSourcesBloc{
  final NewsRepository _repository = NewsRepository();
  final BehaviorSubject<SourceResponse> _subject =
    BehaviorSubject<SourceResponse>();

  Future<void> getSources() async {
    SourceResponse response = await _repository.getSources();
    _subject.sink.add(response);
  }

  void dispose() {
    _subject.close();
  }

  BehaviorSubject<SourceResponse> get subject => _subject;
}

final getSourcesBloc = GetSourcesBloc();