import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/recommended_news_cubit/recommended_news_cubit.dart';
import 'widgets/home_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: PersistentHeader(),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: const [
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
          const SliverFillRemaining(
            child: RecNewsListView(),
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
