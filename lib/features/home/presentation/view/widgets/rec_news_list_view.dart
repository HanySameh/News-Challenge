import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';
import '../../manager/recommended_news_cubit/recommended_news_cubit.dart';
import 'home_widgets.dart';

class RecNewsListView extends StatelessWidget {
  const RecNewsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedNewsCubit, RecommendedNewsState>(
      builder: (context, state) {
        if (state is RecommendedNewsSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.news.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => RecNewsItem(
              newsModel: state.news[index],
            ),
          );
        } else if (state is RecommendedNewsFailureState) {
          return ErrorItem(
            message: state.errMessage,
          );
        } else {
          return const RecNewsLoading();
        }
      },
    );
  }
}
