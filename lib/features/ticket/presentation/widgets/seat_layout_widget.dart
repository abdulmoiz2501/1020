import 'package:flutter/material.dart';
import 'package:book_my_seat/book_my_seat.dart';

import '../../../../core/theme/app_assets.dart';

class SeatLayoutWidgetView extends StatelessWidget {
  final bool isPreview;

  const SeatLayoutWidgetView({Key? key, required this.isPreview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isPreview ? 100 : 300,
      child: SeatLayoutWidget(
        onSeatStateChanged: (rowIndex, colIndex, updatedSeatState) {
          print("Selected seat at Row: $rowIndex, Column: $colIndex, State: $updatedSeatState");
        },
        stateModel: SeatLayoutStateModel(
          rows: 8,
          cols: 12,
          seatSvgSize: isPreview ? 12 : 30,

          pathUnSelectedSeat: AppAssets.regularSeatIcon,
          pathSelectedSeat: AppAssets.selectedSeatIcon,
          pathSoldSeat: AppAssets.notAvailableSeatIcon,
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
    );
  }
}
