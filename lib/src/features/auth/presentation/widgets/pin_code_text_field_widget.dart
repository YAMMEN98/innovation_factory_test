import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/validators/base_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/required_validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeTextFieldWidget extends StatefulWidget {
  final TextEditingController pinCodeController;
  final Function(String value) onChange;

  const PinCodeTextFieldWidget(
      {Key? key, required this.pinCodeController, required this.onChange})
      : super(key: key);

  @override
  State<PinCodeTextFieldWidget> createState() => _PinCodeTextFieldWidgetState();
}

class _PinCodeTextFieldWidgetState extends State<PinCodeTextFieldWidget> {
  // Verification code dialog
  bool _isValidPin = true;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(

      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      appContext: context,
      length: 6,
      obscureText: false,
      textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.grayColor,
            fontWeight: FontWeight.w500,
          ),
      //AppStyle.regular(size: 14).copyWith(
      //                           color: AppColors.white,
      //                         )
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      animationType: AnimationType.fade,
      validator: (value) {
        return BaseValidator.validateValue(
          context,
          value!,
          [
            RequiredValidator(),
          ],
          true,
        );
      },

      backgroundColor: AppColors.transparent,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        activeFillColor: AppColors.transparent,
        inactiveColor: AppColors.borderColor,
        inactiveFillColor: AppColors.transparent,
        selectedFillColor: AppColors.transparent,
        selectedColor: AppColors.borderColor,
        activeColor: AppColors.borderColor,
        borderWidth: 1,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: widget.pinCodeController,
      onCompleted: (v) {
        if (kDebugMode) {
          print("Completed");
        }
      },
      onChanged: (value) {
        widget.onChange.call(value);
      },
      beforeTextPaste: (text) {
        if (kDebugMode) {
          print("Allowing to paste $text");
        }
        return true;
      },
    );
  }
}
