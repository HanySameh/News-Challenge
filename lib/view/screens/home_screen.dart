import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/breaking_slider.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/rec_news_item.dart';
import '../widgets/rec_news_list_view.dart';
import '../widgets/title_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PersistentHeader(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
                // const HomeAppBar(),
                TitleBar(
                  title: 'Breaking News',
                ),
                BreakingSlider(),
                TitleBar(
                  title: 'Recommendation',
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            child: RecNewsListView(size: size),
          ),
        ],
      ),
    );
  }
}

class PersistentHeader extends SliverPersistentHeaderDelegate {
  PersistentHeader();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const HomeAppBar();
  }

  @override
  double get maxExtent => 72.0;

  @override
  double get minExtent => 72.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
