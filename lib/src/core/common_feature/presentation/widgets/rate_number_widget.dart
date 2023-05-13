import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';

class RateNumberWidget extends StatelessWidget {
  final String rateTitle;
  final double rateValue;

  const RateNumberWidget({
    Key? key,
    required this.rateTitle,
    required this.rateValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 3.w,
        horizontal: 9.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: AppColors.darkFontColor.withOpacity(0.3),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Helper.getSvgPath("star.svg"),
          ),

          SizedBox(
            width: 5.w,
          ),

          Text(
            rateTitle,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
          ),
        ],
      ),
    );
  }
}
