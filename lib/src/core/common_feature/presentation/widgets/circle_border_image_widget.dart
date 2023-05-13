import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class CircleBorderImageWidget extends StatelessWidget {
  final String image;

  const CircleBorderImageWidget({Key? key, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.sp,
      height: 45.sp,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.white,
          width: 2.0,
        ),
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
