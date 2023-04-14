import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../home/presentation/view/widgets/home_widgets.dart';
import '../manager/bookmark_cubit/bookmark_cubit.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BookmarkCubit(),
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
                context.read<BookmarkCubit>().getSavedNewsFromStorage();
                if (context.read<BookmarkCubit>().bookmarkedNews.isNotEmpty) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount:
                        context.read<BookmarkCubit>().bookmarkedNews.length,
                    itemBuilder: (context, index) {
                      final String item = context
                          .read<BookmarkCubit>()
                          .bookmarkedNews[index]
                          .toString();
                      return Dismissible(
                        key: Key(item),
                        onDismissed: (direction) => context
                            .read<BookmarkCubit>()
                            .removeNewsModelFromLocal(context
                                .read<BookmarkCubit>()
                                .bookmarkedNews[index]),
                        background: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: const Icon(
                            Icons.bookmark_remove,
                            color: Colors.white,
                            size: 50.0,
                          ),
                        ),
                        child: RecNewsItem(
                          newsModel: context
                              .read<BookmarkCubit>()
                              .bookmarkedNews[index],
                        ),
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
          BlocBuilder<BookmarkCubit, BookmarkState>(
            builder: (context, state) {
              return CustomButton(
                icon: Icons.delete,
                onTap: context.read<BookmarkCubit>().removeAll,
              );
            },
          ),
        ],
      ),
    );
  }
}
