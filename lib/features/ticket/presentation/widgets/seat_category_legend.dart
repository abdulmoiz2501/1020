import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_assets.dart';

class SeatCategoryLegend extends StatelessWidget {
  const SeatCategoryLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width:15.w),
              _buildLegendItem("Selected", AppAssets.selectedSeatIconPng),
              SizedBox(width:80.w),
              _buildLegendItem("Not Available", AppAssets.notAvailableSeatIconPng),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width:15.w),
              _buildLegendItem("VIP (150\$)", AppAssets.vipSeatIconPng),
              SizedBox(width:75.w),
              _buildLegendItem("Regular (50\$)", AppAssets.regularSeatIconPng),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String text, String assetPath) {
    return Row(
      children: [
        Image.asset(
          assetPath,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
