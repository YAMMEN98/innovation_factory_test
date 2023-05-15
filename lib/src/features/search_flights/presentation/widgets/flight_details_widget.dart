import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/circle_border_image_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/tour_model.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/tour_segement_model.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/tag_widget.dart';

class FlightDetailsWidget extends StatefulWidget {
  final List<TourModel> tourModel;

  const FlightDetailsWidget({Key? key, required this.tourModel})
      : super(key: key);

  @override
  State<FlightDetailsWidget> createState() => _FlightDetailsWidgetState();
}

class _FlightDetailsWidgetState extends State<FlightDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Date And Time
        Row(
          children: [
            SvgPicture.asset(
              Helper.getSvgPath("date_time.svg"),
              width: 20.sp,
              height: 20.sp,
            ),
            SizedBox(
              width: 13.sp,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Date
                  Text(
                    HelperUi.formatNamedDateE(DateTime.now()),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkFontColor,
                        ),
                  ),

                  // Day
                  Text(
                    "Tuesday",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrayColor,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(
          height: 20.sp,
        ),

        // From Trip Time Details
        Column(
          children: widget.tourModel.map((e) {
            return Column(
              children: [
                _buildTripTimeDetails(e.tourSegments.first),

                // Time
                TagWidget(
                  title: "3h 50m layover - Jinnah International (KHI)",
                  textWeight: FontWeight.w500,
                  textColor: AppColors.darkFontColor,
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.sp,
                    vertical: 12.5.sp,
                  ),
                  icon: Icon(
                    Icons.access_time_outlined,
                    size: 20.sp,
                    color: AppColors.primaryColor,
                  ),
                  iconSpace: 9.sp,
                ),

                SizedBox(
                  height: 20.sp,
                ),
              ],
            );
          }).toList(),
        ),

        // // To Trip Time Details
        // _buildTripTimeDetails(),

        SizedBox(
          height: 20.sp,
        ),

        //  Destination Details
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pin Location
            SvgPicture.asset(
              Helper.getSvgPath("pin_location.svg"),
              width: 25.sp,
              height: 25.sp,
            ),

            SizedBox(
              width: 15.sp,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Date
                  Text(
                    HelperUi.formatNamedDateE(DateTime.now()),
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkFontColor,
                        ),
                  ),

                  // Day
                  Text(
                    "Tuesday",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.lightGrayColor,
                        ),
                  ),

                  SizedBox(
                    height: 10.sp,
                  ),

                  Text(
                    S.of(context).arrived_at_destination,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),

                  Text(
                    "Dubai",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkFontColor,
                        ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  // Trip Time Details
  _buildTripTimeDetails(TourSegmentModel tourSegmentModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 13.sp,
        ),

        // From- To Details
        Row(
          children: [
            // Image
            CircleBorderImageWidget(
              image: Helper.getImagePath(
                "trip_image.jpg",
              ),
              width: 30.sp,
              height: 30.sp,
              withBorder: false,
            ),

            SizedBox(
              width: 20.sp,
            ),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // From Place And Time
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${HelperUi.formatTimes(
                            DateTime.parse(
                              tourSegmentModel.departureDateTime,
                            ),
                          )} ",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkFontColor,
                                  )),
                      TextSpan(
                        text:
                            " ${tourSegmentModel.airlineName} (${tourSegmentModel.airlineCode})",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.darkFontColor,
                            ),
                      ),
                    ]),
                  ),

                  SizedBox(
                    height: 16.sp,
                  ),

                  // Plane Tracker And Arrival Time
                  Row(
                    children: [
                      Column(
                        children: [
                          // Start Point Of Trip
                          _buildCircleWidget(),

                          // First Line
                          _buildLineWidget(8),

                          _buildPlaneWidget(),

                          // Second Line
                          _buildLineWidget(8),

                          // End Point Of Trip
                          _buildCircleWidget(),
                        ],
                      ),

                      SizedBox(
                        width: 15.sp,
                      ),

                      // Country and Travel Time
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Emirates",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${S.of(context).travel_time} ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w300,
                                        ),
                                  ),
                                  TextSpan(
                                    text: HelperUi.getTravelTime(context, int.tryParse(tourSegmentModel.journeyDuration)??0),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.primaryColor,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 16.sp,
                  ),

                  // To Place And Time
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "${HelperUi.formatTimes(
                            DateTime.parse(
                              tourSegmentModel.arrivalDateTime,
                            ),
                          )} ",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.darkFontColor,
                                  )),
                      TextSpan(
                          text: " (${tourSegmentModel.arrivalAirportCode})",

                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.darkFontColor,
                                  )),
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),

        SizedBox(
          height: 13.sp,
        ),
      ],
    );
  }

  Widget _buildLineWidget(int num) {
    return Column(
      children: [
        for (int i = 0; i < num; i++) ...{
          Container(
            width: 0.6.sp,
            height: 2.h,
            margin: EdgeInsets.only(top: 3.sp, bottom: 3.sp),
            decoration: new BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  8.0,
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

  //Widgets
  Widget _buildPlaneWidget() {
    return SvgPicture.asset(
      Helper.getSvgPath("plane_2.svg"),
      width: 25.sp,
      height: 25.sp,
    );
  }


}
