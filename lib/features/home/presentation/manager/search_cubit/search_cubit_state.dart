part of 'search_cubit_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchCubitInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchFailureState extends SearchState {
  final String errMessage;

  const SearchFailureState(this.errMessage);
}

class SearchSuccessState extends SearchState {
  final List<NewsModel> news;

  const SearchSuccessState(this.news);
}
