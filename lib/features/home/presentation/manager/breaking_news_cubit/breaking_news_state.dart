part of 'breaking_news_cubit.dart';

@immutable
abstract class BreakingNewsState extends Equatable {
  const BreakingNewsState();
  @override
  List<Object?> get props => [];
}

class BreakingNewsInitial extends BreakingNewsState {}

class BreakingNewsLoadingState extends BreakingNewsState {}

class BreakingNewsFailureState extends BreakingNewsState {
  final String errMessage;

  const BreakingNewsFailureState(this.errMessage);
}

class BreakingNewsSuccessState extends BreakingNewsState {
  final List<NewsModel> news;

  const BreakingNewsSuccessState(this.news);
}
