part of 'recommended_news_cubit.dart';

@immutable
abstract class RecommendedNewsState extends Equatable {
  const RecommendedNewsState();
  @override
  List<Object?> get props => [];
}

class RecommendedNewsInitial extends RecommendedNewsState {}

class RecommendedNewsLoadingState extends RecommendedNewsState {}

class RecommendedNewsFailureState extends RecommendedNewsState {
  final String errMessage;

  const RecommendedNewsFailureState(this.errMessage);
}

class RecommendedNewsSuccessState extends RecommendedNewsState {
  final List<NewsModel> news;

  const RecommendedNewsSuccessState(this.news);
}
