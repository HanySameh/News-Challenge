import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/news_model.dart';
import '../../../data/static.dart';

part 'breaking_news_state.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  BreakingNewsCubit() : super(BreakingNewsInitial());
  List<NewsModel> breakingNewsList = [];

  void getBreakingNews() {
    for (var news in news) {
      if (!news.isRecommended) {
        breakingNewsList.add(news);
      }
    }
  }
}
