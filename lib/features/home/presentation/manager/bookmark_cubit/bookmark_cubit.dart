import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_challenge/features/home/data/static.dart';

import '../../../data/models/news_model.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit(this.newsModel) : super(HomeInitial());
  final NewsModel newsModel;
  List<NewsModel> bookmarkedNews = [];

  void addToBookmarked() {
    newsModel.isMark = !newsModel.isMark;
    emit(AddToBookMarkedState());
    addToList();
  }

  void addToList() {
    bookmarkedNews = [];
    for (var element in news) {
      if (element.isMark) {
        bookmarkedNews.add(element);
      }
    }
    emit(BookMarkedState());
  }
}
