import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';

class PlaneObserverWidget extends StatefulWidget {
  final DateTime startDateTrip;
  final DateTime endDateTrip;
  final DateTime dateNowPlane; // Must Date Plane in DateTime.now
  final String flyingFrom;
  final String flyingTo;
  final String travelDuration;

  PlaneObserverWidget({
    required this.startDateTrip,
    required this.endDateTrip,
    required this.dateNowPlane,
    required this.flyingFrom,
    required this.flyingTo,
    required this.travelDuration,
  });

  @override
  State<PlaneObserverWidget> createState() => _PlaneObserverWidgetState();
}

class _PlaneObserverWidgetState extends State<PlaneObserverWidget> {
  double widthWidget = ScreenUtil().screenWidth;
  int numAllLine = 0;
  int numLineBefore = 0;
  int numLineAfter = 0;

  @override
  void initState() {
    numAllLine = widthWidget ~/ 20.w;
    numLineBefore = _getNumLineBefore();
    numLineAfter = numAllLine - numLineBefore;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: widthWidget,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Flights Name
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.flyingFrom,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                ),
                Text(
                  "-",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                ),
                Text(
                  widget.flyingTo,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 10.h,
          ),

          // Flight Line
          Container(
            child: Row(
              children: [
                // Start Point Of Trip
                _buildCircleWidget(),

                // First Line
                Expanded(child: _buildLineWidget(numLineBefore)),

                _buildPlaneWidget(),

                // Second Line
                Expanded(child: _buildLineWidget(numLineAfter)),

                // End Point Of Trip
                _buildCircleWidget(),
              ],
            ),
          ),

          SizedBox(
            height: 8.h,
          ),

          // Flight Times
          Container(
            // width: widthWidget,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  HelperUi.formatTimes(widget.startDateTrip),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayColor,
                      ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      size: 15.sp,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 3.sp,
                    ),
                    Text(
                      HelperUi.getTravelTime(context, int.tryParse(widget.travelDuration)??0),
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayColor,
                          ),
                    ),
                  ],
                ),
                Text(
                  HelperUi.formatTimes(widget.endDateTrip),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayColor,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // String _formatDateView(DateTime dateTime) {
  //   final f = new DateFormat('hh:mm');
  //   return f.format(dateTime);
  // }

  int _getNumLineBefore() {
    int numAllMinutes =
        widget.endDateTrip.difference(widget.startDateTrip).inMinutes;

    int numBeforeMinutes =
        widget.dateNowPlane.difference(widget.startDateTrip).inMinutes;

    int numAfterMinutes = widget.endDateTrip
        .difference(widget.dateNowPlane)
        .inMinutes; // to arrived
    if (numAfterMinutes <= 0) {
      //Arrived
      return numAllLine;
    } else if (numAllMinutes <= 0) {
      // Error in Date
      return 0;
    } else if (numBeforeMinutes <= 0) {
      // The trip hasn't started yet
      return 0;
    }

    return numAllLine * numBeforeMinutes ~/ numAllMinutes;
  }

  //Widgets
  Widget _buildPlaneWidget() {
    return SvgPicture.asset(
      Helper.getSvgPath("plane_3.svg"),
      width: 15.sp,
      height: 15.sp,
    );
  }

  Widget _buildLineWidget(int num) {
    return Row(
      children: [
        for (int i = 0; i < 10; i++) ...{
          Expanded(
            child: Container(
              width: 8.sp,
              height: 0.6.h,
              margin: EdgeInsets.only(left: 3.sp, right: 3.sp),
              decoration: new BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
            ),
          )
        }
      ],
    );
  }

  Widget _buildCircleWidget() {
    return Container(
      padding: EdgeInsets.all(3.sp),
      decoration: new BoxDecoration(
        border: Border.all(
          color: AppColors.primaryColor,
        ),
        shape: BoxShape.circle,
      ),
      child: Container(
        width: 10.sp,
        height: 10.sp,
        decoration: new BoxDecoration(
            color: AppColors.primaryColor,
            image: null,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.primaryColor)
            // borderRadius: BorderRadius.all(Radius.circular(10))
            ),
        // child: Text("ddd"),
      ),
    );
  }
}
