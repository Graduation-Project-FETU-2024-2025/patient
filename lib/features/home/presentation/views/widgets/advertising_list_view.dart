import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:patient_app/features/home/presentation/views/widgets/advertising_item.dart';

class AdvertisingPageView extends StatefulWidget {
  const AdvertisingPageView({super.key});

  @override
  State<AdvertisingPageView> createState() => _AdvertisingPageViewState();
}

class _AdvertisingPageViewState extends State<AdvertisingPageView> {
  final PageController _pageController = PageController();
  final int _itemCount = 4;
  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      _currentIndex++;
      if (_currentIndex >= _itemCount) _currentIndex = 0;

      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 211.h,
      child: PageView.builder(
        controller: _pageController,
        itemCount: _itemCount,
        itemBuilder: (context, index) => const AdvertisingItem(),
      ),
    );
  }
}
