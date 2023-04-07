import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../../../core/utils/router.dart';
import '../../../data/models/news_model.dart';

class RecNewsItem extends StatelessWidget {
  const RecNewsItem({
    super.key,
    required this.newsModel,
  });

  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(
        AppRouter.newsDetailsScreenRoute,
        extra: newsModel,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            height: context.height * 0.15,
            child: Row(
              children: [
                Container(
                  width: context.width * 0.35,
                  height: context.height * 0.15,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: newsModel.image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
                (context.width * 0.04).spaceX,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        newsModel.category,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        newsModel.title,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                NetworkImage(newsModel.authorImage),
                          ),
                          (context.width * 0.015).spaceX,
                          Text(
                            newsModel.authorName,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          (context.width * 0.015).spaceX,
                          const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 3.0,
                          ),
                          (context.width * 0.015).spaceX,
                          Text(
                            newsModel.date,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
