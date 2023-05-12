import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:intl/intl.dart';

class HelperUi {
  /// Get vertical space
  static double getVerticalSpace() {
    return 10.h;
  }

  /// Get horizontal space
  static double getHorizontalSpace() {
    return 10.w;
  }

  static formatDate(DateTime date) {
    final formatted = DateFormat('yyyy-MM-dd');
    return formatted.format(date);
  }

  /// Show snack bar message
  static showSnackBar(BuildContext context, String message,
      {ToastTypeEnum type = ToastTypeEnum.info}) {
    Future.delayed(const Duration(seconds: 0), () {
      AppSnackBar.show(context, message, type);
    });
  }

  /// Show custom dialog with specific page
  static Future showCustomDialog(BuildContext context, Widget child,
      {EdgeInsets? margin,
      bool barrierDismissible = true,
      Color? backgroundColor}) async {
    return showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: backgroundColor ?? Theme.of(context).dialogBackgroundColor,
            ),
            margin: margin ?? EdgeInsets.symmetric(horizontal: 100.w),
            child: child,
          ),
        ],
      ),
    );
  }
}
