import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class CircleStepWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? titleColor;
  final Widget child;

  const CircleStepWidget({
    Key? key,
    this.isSelected = false,
    this.backgroundColor,
    this.borderColor,
    this.titleColor,
    required this.child,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.sp),
          decoration: BoxDecoration(
              color: isSelected
                  ? (backgroundColor ?? AppColors.primaryColor)
                  : AppColors.transparent,
              shape: BoxShape.circle,
              border: isSelected
                  ? null
                  : Border.all(
                      color: borderColor ?? AppColors.primaryColor,
                    )),
          child: child,
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400,
            color: titleColor??AppColors.darkFontColor,
              ),
        )
      ],
    );
  }
}
