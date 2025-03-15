import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../movie/presentation/pages/watch_page.dart';
import '../widgets/custom_nav_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1;


  final List<Widget> _pages = const [
    DashboardPage(),
    WatchPage(),
    MediaLibraryPage(),
    MorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.bottomNavColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(27.r),
            topRight: Radius.circular(27.r),
          ),
        ),
        child: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onChangeIndex: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Dashboard Page',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}





class MediaLibraryPage extends StatelessWidget {
  const MediaLibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'Media Library Page',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}


class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text(
          'More Page',
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}