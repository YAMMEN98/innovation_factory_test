import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController? controller;
  final bool? isPassword;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final Function(String? value)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final AutovalidateMode? autoValidateMode;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final EdgeInsets? contentPadding;
  final double? height;


  const TextFieldWidget({
    Key? key,
    this.controller,
    this.isPassword,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.borderRadius,
    this.borderColor,
    this.borderWidth,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.autoValidateMode,
    this.focusNode,
    this.inputFormatters,
    this.maxLines,
    this.contentPadding,
    this.height,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    double defaultBorderWidth = 1;
    double defaultBorderRadius = 15;
    Color defaultColor = AppColors.borderColor;
    TextStyle hintStyle = Theme.of(context).textTheme.titleLarge!;
    TextStyle textStyle = Theme.of(context).textTheme.bodyMedium!;
    return SizedBox(
      height: widget.height?.h,
      child: TextFormField(
        obscureText: widget.isPassword??false,
        controller: widget.controller,
        onChanged: widget.onChanged,
        validator: widget.validator,
        autovalidateMode: widget.autoValidateMode?? AutovalidateMode.onUserInteraction ,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        style: widget.textStyle ?? textStyle,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          hintStyle: widget.hintStyle??hintStyle,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? defaultColor,
              width: widget.borderWidth ?? defaultBorderWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? defaultColor,
              width: widget.borderWidth ?? defaultBorderWidth,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: AppColors.red,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? defaultBorderRadius),
            borderSide: BorderSide(
              color: widget.borderColor ?? defaultColor,
              width: widget.borderWidth ?? defaultBorderWidth,
            ),
          ),
        ),
      ),
    );
  }
}
