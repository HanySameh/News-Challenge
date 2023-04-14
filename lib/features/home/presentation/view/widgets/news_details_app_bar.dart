import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../bookmark/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import '../../../data/models/models.dart';
import 'home_widgets.dart';

class NewsDetailsAppBar extends StatelessWidget {
  const NewsDetailsAppBar({
    Key? key,
    required this.newsModel,
  }) : super(key: key);
  final NewsModel newsModel;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      expandedHeight: context.height * 0.4,
      backgroundColor: Colors.white,
      elevation: 0.0,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: newsModel.urlToImage!,
                errorWidget: (context, url, error) => Image.asset(
                  AssetsManager.newsImagePlaceholder,
                  fit: BoxFit.cover,
                ),
                placeholder: (context, url) => Image.asset(
                  AssetsManager.newsImagePlaceholder,
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 56.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const CategoryWidget(),
                  15.0.spaceY,
                  SizedBox(
                    width: context.width * 0.8,
                    child: Text(
                      newsModel.title!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                    ),
                  ),
                  7.0.spaceY,
                  Row(
                    children: [
                      Text(
                        'Trending',
                        style: TextStyle(
                          color: Colors.grey[200],
                        ),
                      ),
                      (context.width * 0.02).spaceX,
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 3.0,
                      ),
                      (context.width * 0.02).spaceX,
                      Text(
                        DateFormat.yMMMMEEEEd()
                            .format(DateTime.parse(newsModel.publishedAt!)),
                        style: TextStyle(
                          color: Colors.grey[300],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: Container(
          height: 32.0,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
          ),
          child: Container(
            width: 40.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
        ),
      ),
      leadingWidth: 75.0,
      leading: CustomIconButton(
        onTap: () => GoRouter.of(context).pop(),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            size: 30.0,
          ),
        ),
      ),
      collapsedHeight: context.height * 0.09,
      actions: [
        BlocBuilder<BookmarkCubit, BookmarkState>(
          builder: (context, state) {
            return CustomIconButton(
              onTap: () {
                context.read<BookmarkCubit>().addToBookmarked(newsModel);
              },
              child: Icon(
                newsModel.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                size: 30.0,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CustomIconButton(
            onTap: () {},
            child: const Icon(
              Icons.more_vert,
              size: 30.0,
            ),
          ),
        ),
      ],
    );
  }
}
