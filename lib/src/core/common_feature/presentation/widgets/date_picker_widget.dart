import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerWidget extends StatefulWidget {
  final DateRangePickerSelectionMode? type;
  final DateTime? initialSelectedDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final bool enablePastDates;
  final Function(DateTime dateTime) callback;


  const DatePickerWidget({
    Key? key,
    this.type,
    this.initialSelectedDate,
    this.minDate,
    this.maxDate,
    this.enablePastDates = false,
    required this.callback,

  }) : super(key: key);

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime selectedDateTime;

  @override
  void initState() {
    selectedDateTime = widget.initialSelectedDate?? DateTime.now();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 12.sp,
        vertical: 15.sp,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Close Icon
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 20.sp,
                  color: AppColors.grayColor,
                ),
              ),
            ],
          ),

          // Date Picker
          SfDateRangePicker(
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              selectedDateTime = args.value;
            },

            selectionMode: widget.type ?? DateRangePickerSelectionMode.single,
            initialSelectedDate: selectedDateTime,
            initialDisplayDate: selectedDateTime,
            enablePastDates: widget.enablePastDates,
            minDate: widget.minDate,
            maxDate: widget.maxDate,
          ),

          SizedBox(
            height: 10.sp,
          ),

          // Confirm Button
          ButtonWidget(
            text: S.of(context).confirm,
            onPressed: () {
              widget.callback.call(selectedDateTime);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
