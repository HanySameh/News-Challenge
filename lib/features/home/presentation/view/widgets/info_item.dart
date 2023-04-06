import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../data/models/news_model.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          newsModel.authorName,
          style: TextStyle(
            color: Colors.grey[200],
          ),
        ),
        (context.width * 0.01).spaceX,
        const Icon(
          Icons.verified,
          color: CupertinoColors.activeBlue,
          size: 20,
        ),
        (context.width * 0.02).spaceX,
        const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 3.0,
        ),
        (context.width * 0.02).spaceX,
        Text(
          newsModel.date,
          style: TextStyle(
            color: Colors.grey[300],
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }
}
