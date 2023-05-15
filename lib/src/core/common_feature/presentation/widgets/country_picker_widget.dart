import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/country_code_picker_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';

class CountryPickerWidget extends StatefulWidget {
  final Function(CountryCode? countryCode) callback;
  const CountryPickerWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<CountryPickerWidget> createState() => _CountryPickerWidgetState();
}

class _CountryPickerWidgetState extends State<CountryPickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.borderColor,
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            S.of(context).nationality,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            children: [
              Expanded(
                child: CountryCodePickerWidget(
                  showOnlyCountryOnDialog: true,
                  showOnlyCountryWhenClosed: true,
                  onInit: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: widget.callback,
                ),
              ),


              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.sp,
                color: AppColors.primaryColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
