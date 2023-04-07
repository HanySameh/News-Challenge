import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../home/data/static.dart';
import '../../../home/presentation/manager/bookmark_cubit/bookmark_cubit.dart';
import '../../../home/presentation/view/widgets/home_widgets.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarkCubit(news[0]),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _AppBar(),
            _BookmarkList(),
          ],
        ),
      ),
    );
  }
}

class _BookmarkList extends StatelessWidget {
  const _BookmarkList();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bookmark',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  (context.height * 0.015).spaceY,
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: BlocBuilder<BookmarkCubit, BookmarkState>(
              builder: (context, state) {
                context.read<BookmarkCubit>().addToList();
                if (context.read<BookmarkCubit>().bookmarkedNews.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        context.read<BookmarkCubit>().bookmarkedNews.length,
                    itemBuilder: (context, index) {
                      context.read<BookmarkCubit>().addToList();
                      return RecNewsItem(
                        newsModel:
                            context.read<BookmarkCubit>().bookmarkedNews[index],
                      );
                    },
                  );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.bookmarks_outlined,
                      size: 150.0,
                      color: Colors.grey,
                    ),
                    (context.height * 0.02).spaceY,
                    const Text(
                      'No Bookmarked News',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomButton(
            icon: Icons.menu,
            onTap: () {},
          ),
          CustomButton(
            icon: Icons.search,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
