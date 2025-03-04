library demo_images;

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';

class DemoImages extends StatefulWidget {
  final List<String> urls;
  final double height;
  final bool? autoplay;
  final bool? asset;
  const DemoImages(
      {super.key,
      required this.urls,
      required this.height,
      this.autoplay,
      this.asset = true});

  @override
  State<DemoImages> createState() => _DemoImagesState();
}

class _DemoImagesState extends State<DemoImages> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        autoPlay: widget.autoplay ?? true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      items: widget.urls
          .map((e) => widget.asset! ? Image.asset(e) : Image.network(e))
          .toList(),
    );
  }
}
