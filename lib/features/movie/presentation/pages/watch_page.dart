import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import 'movie_categories_page.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  int _viewMode = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundGrey,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Row(
                children: [
                  Text(
                    'Watch',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(
                      _viewMode == 0 ? Icons.search : Icons.close,
                    ),
                    onPressed: () {
                      setState(() {
                        _viewMode = _viewMode == 0 ? 1 : 0;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: _viewMode == 0
                  ? _buildListView()
                  : const MoviesCategoriesPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.separated(
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          return Container(
            height: 180.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              image: const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/375x180'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 16.h,
                  left: 16.w,
                  child: Text(
                    'Movie Title ${index + 1}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
