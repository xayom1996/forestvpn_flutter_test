import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:forestvpn_test/repositories/news/repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required MockNewsRepository mockNewsRepository,})
      : _mockNewsRepository = mockNewsRepository,
        super(const NewsState()) {
        on<GetNewsEvent>(_onGetNews);
        on<MarkAllReadEvent>(_onMarkAllRead);
      }

  final MockNewsRepository _mockNewsRepository;

  void _onGetNews(GetNewsEvent event, Emitter<NewsState> emit) async {
    emit(
        state.copyWith(
          status: NewsStatus.loading,
        )
    );
    emit(
        state.copyWith(
          articles: await _mockNewsRepository.getLatestArticles(),
          status: NewsStatus.success,
        )
    );
  }

  void _onMarkAllRead(MarkAllReadEvent event, Emitter<NewsState> emit) async {
    emit(
        state.copyWith(
            status: NewsStatus.loading,
        )
    );

    List<Article> newArticles = List<Article>.from(state.articles);
    newArticles.forEach((element) {
      element.readed = true;
    });

    emit(
        state.copyWith(
          status: NewsStatus.success,
          articles: newArticles,
        )
    );
  }
}
