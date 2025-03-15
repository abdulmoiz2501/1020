import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onChangeIndex;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onChangeIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _BottomNavItem(
          index: 0,
          iconPath: AppAssets.dashboardIcon,
          currentIndex: currentIndex,
          onTap: onChangeIndex,
        ),
        _BottomNavItem(
          index: 1,
          iconPath: AppAssets.watchIcon,
          currentIndex: currentIndex,
          onTap: onChangeIndex,
        ),
        _BottomNavItem(
          index: 2,
          iconPath: AppAssets.mediaLibraryIcon,
          currentIndex: currentIndex,
          onTap: onChangeIndex,
        ),
        _BottomNavItem(
          index: 3,
          iconPath: AppAssets.moreIcon,
          currentIndex: currentIndex,
          onTap: onChangeIndex,
        ),
      ],
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  final int index;
  final String iconPath;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _BottomNavItem({
    Key? key,
    required this.index,
    required this.iconPath,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isActive = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            height: 67.h,
            width: 67.h,
            color: isActive ? Colors.white : Colors.grey,
          ),
        ],
      ),
    );
  }
}
