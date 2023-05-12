import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? radius;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Function()? onPressed;
  final double? elevation;
  final Color? borderColor;
  final Color? shadowColor;

  const ButtonWidget({
    Key? key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.radius,
    this.horizontalPadding,
    this.verticalPadding,
    this.onPressed,
    this.elevation,
    this.borderColor,
    this.shadowColor,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.white,
        );

    return ElevatedButton(
      onPressed: widget.onPressed??(){},
      style: ElevatedButton.styleFrom(
        elevation: widget.elevation??0,
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding??15,
          vertical: widget.verticalPadding??15,
        ),
        backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          side: widget.borderColor!=null?
          BorderSide(
            color: widget.borderColor!,
          ):const BorderSide(
            color: AppColors.transparent,
          ),
          borderRadius: BorderRadius.circular(
            widget.radius ?? 30,
          ),
        ),
        shadowColor: widget.shadowColor??AppColors.lightGrayColor,

      ),
      child: Text(
        widget.text,
        style: widget.textStyle ?? textStyle,
      ),
    );
  }
}
