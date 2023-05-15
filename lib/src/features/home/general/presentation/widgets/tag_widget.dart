import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class TagWidget extends StatelessWidget {
  final double? height;
  final String title;
  final Color? textColor;
  final FontWeight? textWeight;
  final Color? borderColor;
  final bool hasBorder;
  final EdgeInsets? padding;
  final Widget? icon;
  final double? iconSpace;

  const TagWidget({
    Key? key,
    required this.title,
    this.height,
    this.textColor,
    this.textWeight,
    this.borderColor,
    this.hasBorder = false,
    this.padding,
    this.icon,
    this.iconSpace,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding?? EdgeInsets.symmetric(
        vertical: 3.w,
        horizontal: 9.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: AppColors.tagColor,
        border: hasBorder
            ? Border.all(
                color: borderColor ?? AppColors.borderColor,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(icon != null)...{
            icon!,

            SizedBox(
              width: iconSpace??3.sp,
            ),
          },

          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: textWeight??FontWeight.w600,
                    color: textColor??AppColors.primaryColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
