import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';

class MobileWidget extends StatefulWidget {
  final Function(String? countryCode, String mobile) callback;

  const MobileWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<MobileWidget> createState() => _MobileWidgetState();
}

class _MobileWidgetState extends State<MobileWidget> {
  final _mobileController = TextEditingController();
  String selectedCountryCode = "+971";

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
            S
                .of(context)
                .mobile,
            style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          Row(
            children: [
              Flexible(
                child: CountryCodePicker(
                  onChanged: (value) {
                    selectedCountryCode = value.code??defaultStr;
                    widget.callback.call(selectedCountryCode, _mobileController.text.trim());
                  },
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: true,
                  padding: EdgeInsets.zero,

                  flagDecoration: BoxDecoration(
                    shape: BoxShape.circle
                  ),
                ),
              ),


              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20.sp,
                color: AppColors.primaryColor,
              ),

              SizedBox(
                width: 5.sp,
              ),

              Expanded(
                flex: 2,
                child: TextFieldWidget(
                controller: _mobileController,
                isUnderLineBorder: true,
                borderWidth: 0,
                contentPadding: EdgeInsets.zero,
                onChanged: (value) {
                  widget.callback.call(selectedCountryCode, _mobileController.text.trim());

                },
              ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
