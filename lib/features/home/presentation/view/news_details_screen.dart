import 'package:flutter/material.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../data/models/news_model.dart';
import 'widgets/home_widgets.dart';

class NewsDetailsScreen extends StatelessWidget {
  const NewsDetailsScreen({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                NewsDetailsAppBar(
                  newsModel: newsModel,
                ),
                SliverToBoxAdapter(
                  child: NewsDetailsBody(newsModel: newsModel),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.width,
              height: context.height * 0.25,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
