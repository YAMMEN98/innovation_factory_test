import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SpinKitFoldingCube(
            size: 20.sp,
            color: AppColors.primaryColor,
            // itemBuilder: (BuildContext context, int index) {
            //   return DecoratedBox(
            //     decoration: BoxDecoration(
            //         color: AppColors.primaryColor,
            //         borderRadius: BorderRadius.circular(25)),
            //   );
            // },
          )),
    );
  }
}
