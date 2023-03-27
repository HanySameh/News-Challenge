import 'package:flutter/material.dart';

import '../../data/static.dart';
import 'rec_news_item.dart';

class RecNewsListView extends StatelessWidget {
  const RecNewsListView({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recNewsList.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) => RecNewsItem(
        size: size,
        recModel: recNewsList[index],
      ),
    );
  }
}
