import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';

class CustomCheckboxWidget extends StatefulWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  CustomCheckboxWidget(
      {Key? key, required this.isChecked, required this.onChanged})
      : super(key: key);

  @override
  _CustomCheckboxWidgetState createState() => _CustomCheckboxWidgetState();
}

class _CustomCheckboxWidgetState extends State<CustomCheckboxWidget> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: Container(
        width: 16.sp,
        height: 16.sp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: _isChecked ? AppColors.primaryColor : AppColors.borderColor,
          ),
          borderRadius: BorderRadius.circular(3),
          color: _isChecked ? AppColors.primaryColor : AppColors.transparent,
        ),
        child: _isChecked
            ? Center(
                child: SvgPicture.asset(
                  Helper.getSvgPath("checked.svg"),
                  width: 12,
                  height: 12,
                ),
              )
            : null,
      ),
    );
  }
}
