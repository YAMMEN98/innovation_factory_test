import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class GeneralDialogWidget extends StatefulWidget {
  final Widget? content;
  final Widget? icon;
  final String? title;
  final TextStyle? titleStyle;
  final String subtitle;
  final TextStyle? subtitleStyle;
  final TextAlign? subTitleAlign;
  final Function? cancelCallback;
  final Function? callback;
  final EdgeInsets contentPadding;
  final String? primaryButtonName;
  final TextStyle? primaryButtonTextStyle;
  final String? secondaryButtonName;
  final double? height;
  final bool isVerticalButton;

  const GeneralDialogWidget(
      {Key? key,
      this.content,
      this.icon,
      this.title,
      this.titleStyle,
      this.height,
      this.isVerticalButton = false,
      required this.subtitle,
      this.subtitleStyle,
      this.subTitleAlign,
      this.cancelCallback,
      this.callback,
      this.primaryButtonName,
      this.primaryButtonTextStyle,
      this.secondaryButtonName,
      this.contentPadding = const EdgeInsets.all(15)})
      : super(key: key);

  @override
  State<GeneralDialogWidget> createState() => _GeneralDialogWidgetState();
}

class _GeneralDialogWidgetState extends State<GeneralDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).dialogBackgroundColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: widget.contentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // General icon
                  if (widget.icon != null) ...[
                    widget.icon!,
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                  // General title
                  if (widget.title != null) ...[
                    Text(
                      widget.title!,
                      style: widget.titleStyle ??
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],

                  // General Sub Title
                  SizedBox(
                    height: widget.height,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.subtitle,
                        textAlign: widget.subTitleAlign ?? TextAlign.center,
                        style: widget.subtitleStyle ??
                            Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.h,
                  ),

                  // Content
                  if (widget.content != null) ...{
                    widget.content!,
                  },

                  // Actions
                  if (widget.isVerticalButton) ...{
                    Column(
                      children: [
                        if (widget.primaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.primaryButtonName!,
                              textStyle: widget.primaryButtonTextStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                              onPressed: () {
                                widget.callback?.call();
                              },
                            ),
                          ),
                        ],
                        SizedBox(
                          height: 10.h,
                        ),
                        if (widget.secondaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.secondaryButtonName!,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.grayColor,
                                  ),
                              borderColor: AppColors.grayColor,
                              onPressed: () {
                                widget.cancelCallback?.call();
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  } else ...{
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.secondaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.secondaryButtonName!,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.grayColor,
                                  ),
                              borderColor: AppColors.grayColor,
                              onPressed: () {
                                widget.cancelCallback?.call();
                              },
                              backgroundColor: AppColors.white,
                            ),
                          ),
                        ],
                        SizedBox(
                          width: 10.w,
                        ),
                        if (widget.primaryButtonName != null) ...[
                          Flexible(
                            child: ButtonWidget(
                              horizontalPadding: 20.w,
                              text: widget.primaryButtonName!,
                              textStyle: widget.primaryButtonTextStyle ??
                                  Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.white,
                                      ),
                              onPressed: () {
                                widget.callback?.call();
                              },
                            ),
                          ),
                        ],
                      ],
                    ),
                  }
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
