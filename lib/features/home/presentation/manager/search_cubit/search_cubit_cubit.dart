import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failures.dart';
import '../../../data/models/models.dart';
import '../../../data/repos/home_repo.dart';

part 'search_cubit_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.homeRepo) : super(SearchCubitInitial());
  final HomeRepo homeRepo;

  Future<void> search(String value) async {
    emit(SearchLoadingState());
    Either<Failure, List<NewsModel>> result =
        await homeRepo.search(value: value);
    result.fold((failure) {
      emit(SearchFailureState(failure.errMessage));
    }, (news) {
      emit(SearchSuccessState(news));
    });
  }
}
