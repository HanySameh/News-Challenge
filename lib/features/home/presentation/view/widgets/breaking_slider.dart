import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/static.dart';
import 'home_widgets.dart';

class BreakingSlider extends StatefulWidget {
  const BreakingSlider({super.key});

  @override
  State<BreakingSlider> createState() => _BreakingSliderState();
}

class _BreakingSliderState extends State<BreakingSlider> {
  int _current = 0;
  late final CarouselController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: _controller,
          itemCount: news.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  BreakingSliderItem(
            size: size,
            newsModel: news[itemIndex],
          ),
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: news.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: _current == entry.key ? 30.0 : 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  borderRadius: BorderRadius.circular(30.0),
                  color: _current == entry.key
                      ? CupertinoColors.activeBlue
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
