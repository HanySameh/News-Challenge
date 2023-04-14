import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../home/data/models/models.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(HomeInitial());
  List<NewsModel> bookmarkedNews = [];
  final String _bookmarksLocalKay = 'savedNews';

  void addToBookmarked(NewsModel newsModel) {
    getSavedNewsFromStorage();
    newsModel.isBookmarked = !newsModel.isBookmarked;
    if (newsModel.isBookmarked && !bookmarkedNews.contains(newsModel)) {
      saveNewsToStorage(newsModel);
    } else if (!newsModel.isBookmarked && bookmarkedNews.contains(newsModel)) {
      removeNewsModelFromLocal(newsModel);
    } else {
      debugPrint('This news is Already Bookmarked before');
    }
    emit(AddToBookMarkedState());
  }

  Future<void> saveNewsToStorage(NewsModel newsModel) async {
    final pref = await SharedPreferences.getInstance();
    final newsJson = jsonEncode(newsModel.toJson());

    final savedNews = pref.getStringList(_bookmarksLocalKay) ?? [];
    savedNews.add(newsJson);
    pref.setStringList(_bookmarksLocalKay, savedNews);
  }

  Future<void> getSavedNewsFromStorage() async {
    final pref = await SharedPreferences.getInstance();
    final savedNews = pref.getStringList(_bookmarksLocalKay) ?? [];

    bookmarkedNews = savedNews.map((newsJson) {
      final newsMap = jsonDecode(newsJson);
      return NewsModel.fromJson(newsMap);
    }).toList();
    emit(GetBookMarkedState());
  }

  Future<void> removeNewsModelFromLocal(NewsModel newsModel) async {
    final pref = await SharedPreferences.getInstance();
    final newsJsonList = pref.getStringList(_bookmarksLocalKay) ?? [];
    bookmarkedNews = newsJsonList
        .map((jsonString) => NewsModel.fromJson(jsonDecode(jsonString)))
        .toList();
    bookmarkedNews.remove(newsModel);
    saveListOfModels(bookmarkedNews);
    emit(RemoveBookMarkedState());
  }

  Future<void> removeAll() async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  Future<void> saveListOfModels(List<NewsModel> newsModels) async {
    final pref = await SharedPreferences.getInstance();
    final jsonList =
        newsModels.map((model) => jsonEncode(model.toJson())).toList();
    pref.setStringList(_bookmarksLocalKay, jsonList);
  }
}
