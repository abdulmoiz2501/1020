import 'package:book_my_seat/book_my_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../movie_detail/presentation/widgets/custom_button.dart';
import '../widgets/seat_category_legend.dart';
import '../widgets/seat_layout_widget.dart';

class SeatDetailsPage extends StatelessWidget {
  final String movieTitle;
  final String releaseDate;
  final String selectedDate;
  final String selectedTime;

  const SeatDetailsPage({
    Key? key,
    required this.movieTitle,
    required this.releaseDate,
    required this.selectedDate,
    required this.selectedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColor,
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              movieTitle,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              "In Theaters $releaseDate",
              style: TextStyle(color: Colors.blue, fontSize: 12.sp),
            ),
            SizedBox(height: 10.h),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),

      ),
      body: Column(
        children: [
          SizedBox(height: 40.h,),
          Expanded(
            child: SeatLayoutWidget(
              onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
                print("Seat selected: Row $rowIndex, Column $colIndex, State: $updatedSeatState");
              },
              stateModel: SeatLayoutStateModel(
                rows: 8,
                cols: 12,
                seatSvgSize: 30,
                pathUnSelectedSeat: AppAssets.vipSeatIcon,
                pathSelectedSeat: AppAssets.vipSeatIcon,
                pathSoldSeat: AppAssets.vipSeatIcon,
                pathDisabledSeat: AppAssets.vipSeatIcon,
                currentSeatsState: List.generate(
                  8,
                      (row) => List.generate(
                    12,
                        (col) => col % 3 == 0
                        ? SeatState.sold
                        : col % 5 == 0
                        ? SeatState.disabled
                        : SeatState.unselected,
                  ),
                ),
              ),
            ),
          ),
          const SeatCategoryLegend(),

          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.darkgreyColor,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "\$50",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),


                CustomButton(
                  text: "Proceed to Pay",
                  onPressed: () {
                  },
                  buttonColor: AppColors.blueColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
