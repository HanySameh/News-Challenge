import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/error_widget.dart';
import '../../manager/breaking_news_cubit/breaking_news_cubit.dart';
import 'home_widgets.dart';

class BreakingSlider extends StatefulWidget {
  const BreakingSlider({super.key});

  @override
  State<BreakingSlider> createState() => _BreakingSliderState();
}

class _BreakingSliderState extends State<BreakingSlider> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BreakingNewsCubit, BreakingNewsState>(
      builder: (context, state) {
        if (state is BreakingNewsSuccessState) {
          return Column(
            children: [
              CarouselSlider.builder(
                carouselController:
                    context.read<BreakingNewsCubit>().carouselController,
                itemCount: state.news.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        BreakingSliderItem(
                  newsModel: state.news[itemIndex],
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      context.read<BreakingNewsCubit>().current = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: state.news.asMap().entries.map(
                  (entry) {
                    return GestureDetector(
                      onTap: () => context
                          .read<BreakingNewsCubit>()
                          .carouselController
                          .animateToPage(entry.key),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: context.read<BreakingNewsCubit>().current ==
                                entry.key
                            ? 30.0
                            : 12.0,
                        height: 12.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 4.0,
                        ),
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          borderRadius: BorderRadius.circular(30.0),
                          color: context.read<BreakingNewsCubit>().current ==
                                  entry.key
                              ? CupertinoColors.activeBlue
                              : Colors.grey,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          );
        } else if (state is BreakingNewsFailureState) {
          return ErrorItem(
            message: state.errMessage,
          );
        } else {
          return const BreakingNewsLoading();
        }
      },
    );
  }
}
