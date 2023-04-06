import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class NewsDetailsCubit extends Cubit<NewsDetailsState> {
  NewsDetailsCubit() : super(HomeInitial());
  bool isMark = false;

  void addToBookmarked() {
    isMark = !isMark;
    emit(AddToBookMarkedState());
  }
}
