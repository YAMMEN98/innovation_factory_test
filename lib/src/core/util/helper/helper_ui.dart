import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
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
      builder: (ctx) => Container(
        margin: margin ??
            EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backgroundColor ??
                      Theme.of(context).dialogBackgroundColor,
                ),
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Format Date as 18 Apr 2023
  static String formatNamedDate(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  // Format Date as Sat, 13 Apr
  static String formatNamedDateE(DateTime dateTime) {
    DateFormat outputFormat = DateFormat('E, d MMM');
    return outputFormat.format(dateTime);
  }
}
