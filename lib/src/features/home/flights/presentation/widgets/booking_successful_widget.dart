import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';

class BookingSuccessfulWidget extends StatefulWidget {
  final Function? callback;
  final EdgeInsets contentPadding;

  const BookingSuccessfulWidget({
    Key? key,
    required this.contentPadding,
    this.callback,
  }) : super(key: key);

  @override
  State<BookingSuccessfulWidget> createState() =>
      _BookingSuccessfulWidgetState();
}

class _BookingSuccessfulWidgetState extends State<BookingSuccessfulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: widget.contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Verification Code Icon
                SvgPicture.asset(
                  Helper.getSvgPath("booking_successful.svg"),
                  width: 150.h,
                  height: 150.h,
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Title
                Text(
                  S.of(context).booking_successful,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.center,
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Sub Title
                Text(
                  S.of(context).we_will_send_an_email,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                  textAlign: TextAlign.center,
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Done Button
                Center(
                  child: ButtonWidget(
                    horizontalPadding: 40.sp,
                    verticalPadding: 10.sp,
                    text: S.of(context).done,
                    textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                    onPressed: () async {
                      widget.callback?.call();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
