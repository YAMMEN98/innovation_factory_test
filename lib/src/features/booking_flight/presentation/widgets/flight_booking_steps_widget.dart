import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/booking_flight/presentation/widgets/circle_step_widget.dart';

class FlightBookingStepsWidget extends StatefulWidget {
  const FlightBookingStepsWidget({Key? key}) : super(key: key);

  @override
  State<FlightBookingStepsWidget> createState() =>
      _FlightBookingStepsWidgetState();
}

class _FlightBookingStepsWidgetState extends State<FlightBookingStepsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // First Step (Customize)
        CircleStepWidget(
          child: Icon(
            Icons.luggage,
            size: 20.sp,
            color: AppColors.white,
          ),
          title: S.of(context).customize,
          isSelected: true,
        ),


        // Divider
        Expanded(
          child: Column(
            children: [
              Divider(
                color: AppColors.primaryColor,
              ),

              SizedBox(
                height: 5.sp,
              ),

            ],
          ),
        ),

        // First Step (Passenger Info)
        CircleStepWidget(
          child: Icon(
            Icons.people,
            size: 20.sp,
            color: AppColors.primaryColor,
          ),
          title: S.of(context).passenger_info,
        ),


        // Divider
        Expanded(
          child: Column(
            children: [
              Divider(
                color: AppColors.primaryColor,
              ),

              SizedBox(
                height: 5.sp,
              ),

            ],
          ),
        ),

        // First Step (Payment)
        CircleStepWidget(
          child: Icon(
            Icons.payment_sharp,
            size: 20.sp,
            color: AppColors.lightGrayColor,
          ),
          borderColor: AppColors.lightGrayColor,
          titleColor: AppColors.lightGrayColor,

          title: S.of(context).payment,
        ),
      ],
    );
  }
}
