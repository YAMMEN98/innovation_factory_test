import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/language_enum.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/date_picker_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
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
      ),
    );
  }

  // Format Date as 18 Apr 2023
  static String formatToStandardDate(DateTime dateTime) {
    DateFormat format = DateFormat('yyyy-MM-dd', LanguageEnum.en.local);
    String date = format.format(dateTime);
    return date;
  }


  // Format Date as 18 Apr 2023
  static String formatNamedDate(DateTime dateTime) {
    String formattedDate = DateFormat('dd MMM yyyy', LanguageEnum.en.local).format(dateTime);
    return formattedDate;
  }


  // Format Date as 18 Apr 2023
  static DateTime formatNameStringToDate(String dateTimeString) {
    DateFormat format = DateFormat('dd MMM yyyy', LanguageEnum.en.local);
    DateTime date = format.parse(dateTimeString);
    return date;
  }

  // Format Date as Sat, 13 Apr
  static String formatNamedDateE(DateTime dateTime) {
    DateFormat outputFormat = DateFormat('E, d MMM', LanguageEnum.en.local);
    return outputFormat.format(dateTime);
  }

  // Format  as 12:00
  static String formatTimes(DateTime dateTime) {
    final outputFormat = new DateFormat('hh:mm', LanguageEnum.en.local);
    return outputFormat.format(dateTime);
  }

  // Show Date Picker
  static void showDatePicker({
    required BuildContext context,
    DateRangePickerSelectionMode? type,
    DateTime? initialSelectedDate,
    bool enablePastDates = false,
    DateTime? minDate,
    DateTime? maxDate,
    required Function(DateTime dateTime) callback,


  }) {
    showCustomDialog(
      context,
      DatePickerWidget(
        type: type,
        initialSelectedDate: initialSelectedDate,
        enablePastDates: enablePastDates,
        minDate: minDate,
        maxDate: maxDate,
        callback: callback,

      ),
    );
  }

  static String getTravelTime(BuildContext context, int durationInMinutes) {
    int hours = durationInMinutes ~/ 60;
    int minutes = durationInMinutes % 60;

    return "$hours${S.of(context).h} $minutes${S.of(context).m}";
  }
}
