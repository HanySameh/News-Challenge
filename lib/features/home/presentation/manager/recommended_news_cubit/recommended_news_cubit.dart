import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/models.dart';
import '../../../data/repos/home_repo.dart';

part 'recommended_news_state.dart';

class RecommendedNewsCubit extends Cubit<RecommendedNewsState> {
  RecommendedNewsCubit(this.homeRepo) : super(RecommendedNewsInitial());
  final HomeRepo homeRepo;

  Future<void> fetchRecommendedNews() async {
    emit(RecommendedNewsLoadingState());
    Either<Failure, List<NewsModel>> result =
        await homeRepo.fetchRecommendedNews();
    result.fold((failure) {
      emit(RecommendedNewsFailureState(failure.errMessage));
    }, (news) {
      emit(RecommendedNewsSuccessState(news));
    });
  }
}
