import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../../core/utils/functions/launch_url.dart';
import '../../data/models/models.dart';
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
      floatingActionButton: FloatingActionButton(
        onPressed: () => launchCustomUrl(context, newsModel.url),
        backgroundColor: CupertinoColors.activeBlue,
        child: const Icon(
          Icons.arrow_outward_rounded,
          size: 30.0,
        ),
      ),
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
