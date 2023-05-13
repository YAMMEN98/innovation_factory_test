import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class SelectButtonWidget extends StatefulWidget {
  final String title;
  final Color? titleColor;
  final bool isSelected;
  final Widget? icon;
  final Function()? onTap;

  const SelectButtonWidget(
      {Key? key,
      required this.isSelected,
      required this.title,
      this.icon,
      this.onTap,
      this.titleColor})
      : super(key: key);

  @override
  State<SelectButtonWidget> createState() => _SelectButtonWidgetState();
}

class _SelectButtonWidgetState extends State<SelectButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap?.call();
      },
      child: Container(
        height: 37.h,
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
            color: widget.isSelected
                ? AppColors.primaryColor
                : Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(30.sp),
            border: Border.all(
              color: widget.isSelected
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
            ),
            boxShadow: widget.isSelected
                ? [
                    BoxShadow(
                      color: AppColors.shadowColor,
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ]
                : null),
        child: Row(
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: widget.isSelected
                        ? AppColors.white
                        : widget.titleColor ?? AppColors.lightGrayColor,
                  ),
            ),
            if (widget.icon != null) ...{
              SizedBox(
                width: 5.w,
              ),
              widget.icon!,
            }
          ],
        ),
      ),
    );
  }
}
