import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/features/home/flights/presentation/widgets/booking_successful_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/tag_widget.dart';

class LimitedOfferCardWidget extends StatefulWidget {
  const LimitedOfferCardWidget({Key? key}) : super(key: key);

  @override
  State<LimitedOfferCardWidget> createState() => _LimitedOfferCardWidgetState();
}

class _LimitedOfferCardWidgetState extends State<LimitedOfferCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.sp,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20.sp),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 3,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20.sp),
            child: Image.asset(
              Helper.getImagePath("offer_example.png"),
              width: 300.sp,
              height: 150.h,
              fit: BoxFit.cover,
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 20.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Get Up to 20% OFF On Flights with Us",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),

                // Spacing
                SizedBox(
                  height: 5.h,
                ),

                Text(
                  "BreakTheBookingRoutine NOW",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayColor,
                      ),
                ),

                Divider(
                  color: AppColors.borderColor,
                ),

                // Spacing
                SizedBox(
                  height: 5.h,
                ),

                // Code And Booking
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Code
                    Flexible(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        runSpacing: 5.sp,
                        children: [
                          // Code
                          Text(
                            S.of(context).code,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                          ),

                          SizedBox(
                            width: 5.w,
                          ),

                          TagWidget(
                            title: "X7HJ3",
                          ),
                        ],
                      ),
                    ),

                    // Spacing
                    SizedBox(
                      width: 5.w,
                    ),

                    // Booking
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SvgPicture.asset(
                          Helper.getSvgPath("share.svg"),
                          width: 15.sp,
                          height: 15.sp,
                        ),

                        // Spacing
                        SizedBox(
                          width: 5.w,
                        ),

                        Text(
                          S.of(context).share,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: AppColors.grayColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),

                        // Spacing
                        SizedBox(
                          width: 10.w,
                        ),

                        ButtonWidget(
                          text: S.of(context).book_now,
                          onPressed: () {
                            HelperUi.showCustomDialog(
                              context,
                              BookingSuccessfulWidget(
                                contentPadding: EdgeInsets.only(
                                    top: 30.h,
                                    bottom: 21.h,
                                    left: 21.w,
                                    right: 21.w),
                              ),
                            );
                          },
                          horizontalPadding: 10.sp,
                          verticalPadding: 3.sp,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
