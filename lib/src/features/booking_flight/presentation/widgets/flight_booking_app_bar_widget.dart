import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/arrow_back_button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/circle_border_image_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';

class FlightBookingAppBarWidget extends StatefulWidget {
  final String title;

  const FlightBookingAppBarWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<FlightBookingAppBarWidget> createState() =>
      _FlightBookingAppBarWidgetState();
}

class _FlightBookingAppBarWidgetState extends State<FlightBookingAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.primaryColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.sp,
        ),
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
            ),

            // Content
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Arrow Back Button
                ArrowBackButtonWidget(
                  iconColor: AppColors.white,

                ),

                // Title
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                    color: AppColors.white,
                      ),
                ),

                // Profile Image
                CircleBorderImageWidget(
                  image: Helper.getImagePath(
                    "profile_image.jpg",
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 15.sp,
            ),

          ],
        ),
      ),
    );
  }
}
