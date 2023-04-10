import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    Key? key,
    required this.activeIndex,
  }) : super(key: key);

  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: 3,
      effect: const WormEffect(
          dotColor: Colors.grey,
          activeDotColor: Colors.black,
          dotHeight: 8,
          dotWidth: 8),
    );
  }
}
