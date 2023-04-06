import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recommended_news_state.dart';

class RecommendedNewsCubit extends Cubit<RecommendedNewsState> {
  RecommendedNewsCubit() : super(RecommendedNewsInitial());
}
