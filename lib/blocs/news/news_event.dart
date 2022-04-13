part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class GetNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class MarkAllReadEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}
