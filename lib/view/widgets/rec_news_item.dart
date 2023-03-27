import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/rec_model.dart';

class RecNewsItem extends StatelessWidget {
  const RecNewsItem({
    super.key,
    required this.size,
    required this.recModel,
  });

  final Size size;
  final RecModel recModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: SizedBox(
          height: size.height * 0.15,
          child: Row(
            children: [
              Container(
                width: size.width * 0.35,
                height: size.height * 0.15,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: CachedNetworkImage(
                  imageUrl: recModel.image,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      recModel.category,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      recModel.title,
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
                          backgroundImage: NetworkImage(recModel.authorImage),
                        ),
                        SizedBox(
                          width: size.width * 0.015,
                        ),
                        Text(
                          recModel.authorName,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.015,
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 3.0,
                        ),
                        SizedBox(
                          width: size.width * 0.015,
                        ),
                        Text(
                          recModel.date,
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
    );
  }
}
