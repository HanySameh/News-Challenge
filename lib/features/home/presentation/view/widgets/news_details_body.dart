import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../data/models/news_model.dart';

class NewsDetailsBody extends StatelessWidget {
  const NewsDetailsBody({
    super.key,
    required this.newsModel,
  });
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.0,
                backgroundImage: NetworkImage(
                  newsModel.authorImage,
                ),
              ),
              (context.width * 0.02).spaceX,
              Text(
                newsModel.authorName,
                style: const TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              (context.width * 0.01).spaceX,
              const Icon(
                Icons.verified,
                color: CupertinoColors.activeBlue,
                size: 20,
              ),
            ],
          ),
          (context.height * 0.04).spaceY,
          Text(
            newsModel.description.replaceAll('. ', '.\n\n'),
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          (context.height * 0.04).spaceY,
        ],
      ),
    );
  }
}
