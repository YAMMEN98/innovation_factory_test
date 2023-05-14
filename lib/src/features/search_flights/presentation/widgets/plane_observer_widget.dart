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

  PlaneObserverWidget(
      {required this.startDateTrip,
      required this.endDateTrip,
      required this.dateNowPlane});

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
                  "DXB",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                ),
                Text(
                  "KHI",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkFontColor,
                      ),
                ),
                Text(
                  "LHI",
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
                  HelperUi.formatTimes(widget.endDateTrip),
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
                      "${widget.dateNowPlane.difference(widget.startDateTrip).inHours}h ${widget.dateNowPlane.difference(widget.startDateTrip).inMinutes - (widget.dateNowPlane.difference(widget.startDateTrip).inHours * 60)}m",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.grayColor,
                          ),
                    ),
                  ],
                ),
                Text(
                  HelperUi.formatTimes(widget.startDateTrip),
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
      Helper.getSvgPath("plane.svg"),
      width: 25.sp,
      height: 25.sp,
    );
  }

  Widget _buildLineWidget(int num) {
    return Row(
      children: [
        for (int i = 0; i < num; i++) ...{
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
