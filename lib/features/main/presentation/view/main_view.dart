import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:patient_app/core/utils/app_colors.dart';
import 'package:patient_app/core/utils/app_images.dart';
import 'package:patient_app/features/home/presentation/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();
  int currentIndex = 0;
  double kIconSize = 24.0;
  double kBottomRadius = 20.0;
  List<Widget> screens = [
    const HomeView(),
    const Scaffold(
      body: Center(child: Text('Search Screen')),
    ),
    const Scaffold(
      body: Center(child: Text('Profile Screen')),
    ),
    const Scaffold(
      body: Center(child: Text('Settings Screen')),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: notchBottomBarController,
        bottomBarItems: [
          BottomBarItem(
            activeItem: Image.asset(AppImages.imagesSelectedHome),
            inActiveItem: Image.asset(AppImages.imagesUnselectedHome),
          ),
          BottomBarItem(
            activeItem: Image.asset(AppImages.imagesSelectedSchedule),
            inActiveItem: Image.asset(AppImages.imagesUnselectedSchedule),
          ),
          BottomBarItem(
            activeItem: Image.asset(AppImages.imagesSelectedPharmacy),
            inActiveItem: Image.asset(AppImages.imagesUnselectedPharmacy),
          ),
          BottomBarItem(
            activeItem: Image.asset(AppImages.imagesSelectedProfile),
            inActiveItem: Image.asset(AppImages.imagesUnselectedProfile),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        kIconSize: kIconSize,
        kBottomRadius: kBottomRadius,
        color: AppColors.primaryColor,
      ),
    );
  }
}
