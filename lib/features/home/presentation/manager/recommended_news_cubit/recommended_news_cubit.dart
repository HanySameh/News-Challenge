import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/news_model.dart';

part 'recommended_news_state.dart';

class RecommendedNewsCubit extends Cubit<RecommendedNewsState> {
  RecommendedNewsCubit() : super(RecommendedNewsInitial());
  List<NewsModel> recNewsList = [];
}
