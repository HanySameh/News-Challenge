import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/breaking_model.dart';
import '../../../data/static.dart';

class BreakingSliderItem extends StatelessWidget {
  const BreakingSliderItem({
    super.key,
    required this.size,
    required this.breakingModel,
  });

  final Size size;
  final BreakingModel breakingModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.85,
      height: size.height * 0.25,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.35),
            offset: const Offset(0, 7),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: breakingModel.image,
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 20.0,
              ),
              color: Colors.black.withOpacity(0.35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * 0.15,
                    height: size.height * 0.03,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: CupertinoColors.activeBlue,
                    ),
                    child: const Center(
                      child: Text(
                        'Sports',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        breakingNewsList[0].authorName,
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      const Icon(
                        Icons.verified,
                        color: CupertinoColors.activeBlue,
                        size: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3.0,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text(
                        '${breakingModel.time} hours ago',
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width * 0.6,
                    child: Text(
                      breakingModel.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
