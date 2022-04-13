part of 'news_bloc.dart';

enum NewsStatus {
  initial,
  loading,
  success,
  error,
}

class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.articles = const [],
  });

  final NewsStatus status;
  final List<Article> articles;

  @override
  List<Object> get props => [articles, status];

  NewsState copyWith({
    NewsStatus? status,
    List<Article>? articles,
  }) {
    return NewsState(
      status: status ?? this.status,
      articles: articles ?? this.articles,
    );
  }
}
