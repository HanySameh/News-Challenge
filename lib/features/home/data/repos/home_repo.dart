import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../models/news_model/news_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<NewsModel>>> fetchBreakingNews();
  Future<Either<Failure, List<NewsModel>>> fetchRecommendedNews();
  Future<Either<Failure, List<NewsModel>>> search({required String value});
}
