import 'package:flutter/material.dart';
import 'package:news_challenge/core/utils/extensions.dart';

import '../../../../../core/widgets/shimmer.dart';

class RecNewsLoading extends StatelessWidget {
  const RecNewsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => const RecNewsLoadingListItem(),
      separatorBuilder: (BuildContext context, int index) =>
          (context.height * 0.01).spaceY,
    );
  }
}

class RecNewsLoadingListItem extends StatelessWidget {
  const RecNewsLoadingListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          ShimmerWidget.rectangular(
            width: context.width * 0.35,
            height: context.height * 0.15,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShimmerWidget.rectangular(
                    width: context.width * 0.35,
                    height: context.height * 0.025,
                  ),
                  (context.height * 0.01).spaceY,
                  ShimmerWidget.rectangular(
                    width: context.width * 0.5,
                    height: context.height * 0.025,
                  ),
                  (context.height * 0.02).spaceY,
                  ShimmerWidget.rectangular(
                    width: context.width * 0.26,
                    height: context.height * 0.025,
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
