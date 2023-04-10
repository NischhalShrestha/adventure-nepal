import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'slider_items.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({
    super.key,
    required this.controller,
    required this.onPageChanged,
  });
  final CarouselController controller;
  final void Function(int index) onPageChanged;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: controller,
      options: CarouselOptions(
          height: 200,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: 0.50,
          initialPage: 0,
          pageSnapping: true,
          autoPlay: false,
          onPageChanged: (index, reason) {
            onPageChanged(index);
          }),
      items: sliderItems.map((e) => Image.asset(e.imagePath)).toList(),
    );
  }
}
