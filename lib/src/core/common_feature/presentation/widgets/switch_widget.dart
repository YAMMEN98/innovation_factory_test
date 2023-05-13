import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';

class SwitchWidget extends StatefulWidget {
  final bool value;
  final Function(bool value) callback;

  const SwitchWidget({Key? key, required this.value, required this.callback})
      : super(key: key);

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      width: 47,
      height: 25,
      value: widget.value,
      borderRadius: 30.0,
      padding: 1.0,
      inactiveColor: AppColors.lightGrayColor,
      activeColor: AppColors.primaryColor,
      onToggle: (value) {
        widget.callback.call(value);
      },
    );
  }
}
