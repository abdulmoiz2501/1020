import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tentwenty/features/movie_detail/presentation/widgets/custom_button.dart';
import 'package:tentwenty/features/ticket/presentation/pages/seat_details_page.dart';

import '../../../../core/theme/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/date_selector.dart';

class SeatSelectionPage extends StatelessWidget {
  final String movieTitle;
  final String releaseDate;

  const SeatSelectionPage({
    Key? key,
    required this.movieTitle,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Text("Date", style: TextStyle(fontWeight: FontWeight.bold, ),),
            SizedBox(height: 200.h),
            Text(
              "Date",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            SizedBox(height: 10.h),
            const DateSelector(),
            SizedBox(height: 20.h),


            SizedBox(height: 10.h),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  final times = ["12:30", "13:30", "14:30"];
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SeatDetailsPage(
                              movieTitle: movieTitle,
                              selectedDate: "March 5, 2021",
                              selectedTime: "${times[index]} Hall 1",
                              releaseDate: releaseDate,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "${times[index]}   ",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "Cinetech + Hall 1",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            height: 150.h,
                            width: 240.w,
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              AppAssets.seatImage,
                              width: 150.w,
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(height: 8.h),


                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "From ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: "50\$ ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: "or ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: "2500 bonus",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),



            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (_) => SeatDetailsPage(
                            movieTitle: movieTitle,
                            selectedDate: "March 5, 2021",
                            selectedTime: "12:30 Hall 1",
                            releaseDate: releaseDate,
                          ),
                    ),
                  );
                },
                child: CustomButton(
                  text: "Select seats",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => SeatDetailsPage(
                              movieTitle: movieTitle,
                              selectedDate: "March 5, 2021",
                              selectedTime: "12:30 Hall 1",
                              releaseDate: releaseDate,
                            ),
                      ),
                    );
                  },
                ),
              ),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
