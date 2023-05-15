import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/country_code_picker_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';

class PhoneWidget extends StatefulWidget {
  final Function(String? countryCode, String mobile) callback;

  const PhoneWidget({Key? key, required this.callback}) : super(key: key);

  @override
  State<PhoneWidget> createState() => _PhoneWidgetState();
}

class _PhoneWidgetState extends State<PhoneWidget> {
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
            S.of(context).mobile,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          Row(
            children: [
              Flexible(
                child: CountryCodePickerWidget(
                  showOnlyCountryOnDialog: false,
                  showOnlyCountryWhenClosed: false,
                  onInit: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  onChanged: (value) {
                    selectedCountryCode = value?.code ?? defaultStr;
                    widget.callback.call(
                        selectedCountryCode, _mobileController.text.trim());
                  },
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
                  keyboardType: TextInputType.phone,
                  isUnderLineBorder: true,
                  borderWidth: 0,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    widget.callback.call(
                        selectedCountryCode, _mobileController.text.trim());
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
