import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class ActionButtonWidget extends StatefulWidget {
  final Function() onTap;
  final Widget child;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Widget? floatWidget;
  final bool withBorder;

  const ActionButtonWidget(

      {Key? key, required this.onTap, required this.child, this.backgroundColor, this.borderRadius, this.padding, this.floatWidget, this.withBorder = false,})
      : super(key: key);

  @override
  State<ActionButtonWidget> createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        child: Stack(
          children: [
            Container(
              margin: widget.floatWidget != null ? EdgeInsets.symmetric(
                vertical: 5.sp
              ) : null,
              padding: widget.padding ?? EdgeInsets.all(13.sp),
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? AppColors.white,
                borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 15.sp),
                border: widget.withBorder?Border.all(
                  color: AppColors.borderColor,
                ):null,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: widget.child,
            ),


            if(widget.floatWidget != null)...{
              Positioned(
                top: 0,
                right: 0,
                child: widget.floatWidget!,
              )
            }
          ],
        ),
      ),
    );
  }
}
