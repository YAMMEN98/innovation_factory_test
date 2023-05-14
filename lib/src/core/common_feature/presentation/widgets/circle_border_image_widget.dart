import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class CircleBorderImageWidget extends StatelessWidget {
  final bool withBorder;
  final double? width;
  final double? height;
  final String image;

  const CircleBorderImageWidget({
    Key? key,
    required this.image,
    this.withBorder = true,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width??45.sp,
      height: height?? 45.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: withBorder?
        Border.all(
          color: AppColors.white,
          width: 2.0,
        ):null,
        boxShadow: [
          BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 3,
              blurRadius: 10,
              offset: Offset(0, 10)),
        ],
      ),
      child: CircleAvatar(
        backgroundImage: AssetImage(
          image,
        ),
      ),
    );
  }
}
