import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/circle_border_image_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/features/home/flights/domain/entities/flight_model.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/tag_widget.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/widgets/flight_details_widget.dart';

import 'plane_observer_widget.dart';

class CardTripWidget extends StatefulWidget {
  final FlightModel flightModel;

  const CardTripWidget({super.key, required this.flightModel});

  @override
  State<CardTripWidget> createState() => _CardTripWidgetState();
}

class _CardTripWidgetState extends State<CardTripWidget>
    with TickerProviderStateMixin {
  late final TabController tabController;

  // State of Expansion tile
  bool isShowDetails = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20.sp),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 15,
                offset: Offset(0, 10))
          ]),

      // padding: EdgeInsets.zero,
      child: ExpansionTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.sp),
        ),
        trailing: SizedBox(),
        title: _buildVisibleCardDetails(),
        tilePadding: EdgeInsets.only(
          left: 25.sp,
          top: 20.sp,
          bottom: 20.sp,
        ),
        maintainState: true,
        backgroundColor: AppColors.white,
        childrenPadding: EdgeInsets.only(
          left: 25.sp,
          right: 25.sp,
          bottom: 20.sp,
        ),
        initiallyExpanded: isShowDetails,
        // Key To Rebuild Widget When Update Show Details
        key: GlobalKey(),
        children: _buildInVisibleDetails(),
        onExpansionChanged: (value) {
          setState(() {
            isShowDetails = value;
          });
        },
      ),
    );
  }

  Widget _buildHeaderTripCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Trip Image And Name
        Flexible(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleBorderImageWidget(
                image: Helper.getImagePath(
                  "trip_image.jpg",
                ),
                width: 38.sp,
                height: 38.sp,
                withBorder: false,
              ),
              SizedBox(
                width: 12.sp,
              ),
              Flexible(
                child: Text(
                  "Qatar Airways",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: 5.sp,
        ),

        AutoSizeText(
          widget.flightModel.fareTotal.basic,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
        ),
      ],
    );
  }

  //Description trip
  Widget _buildDescriptionWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: _buildPropertiesWidget(),
        ),
        _showDetailsButton(),
      ],
    );
  }

  // Visible Widget
  Widget _buildVisibleCardDetails() {
    return Column(
      children: [
        // Header Of Card (Image And Price)
        _buildHeaderTripCard(),

        SizedBox(
          height: 20.h,
        ),

        PlaneObserverWidget(
          startDateTrip: DateTime.parse(widget
              .flightModel.tours.first.tourSegments.first.departureDateTime),
          dateNowPlane: DateTime.now(),
          endDateTrip: DateTime.parse(
            widget.flightModel.tours.first.tourSegments.first.arrivalDateTime,
          ),
          flyingFrom: widget
              .flightModel.tours.first.tourSegments.first.departureAirportCode,
          flyingTo: widget
              .flightModel.tours.first.tourSegments.first.departureAirportCode,
          travelDuration:
              widget.flightModel.tours.first.tourSegments.first.journeyDuration,
        ),

        SizedBox(
          height: 20.h,
        ),

        Divider(
          color: AppColors.borderColor,
        ),

        SizedBox(
          height: 2.h,
        ),

        // Description
        if (!isShowDetails) ...{
          _buildDescriptionWidget(),
        },
      ],
    );
  }

  // InVisible Widgets
  List<Widget> _buildInVisibleDetails() {
    return [
      // Tab Bar
      Stack(
        fit: StackFit.passthrough,
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom:
                        BorderSide(color: AppColors.borderColor, width: 2.0),
                  ),
                ),
              ),
            ],
          ),
          TabBar(
            controller: tabController,
            unselectedLabelColor: AppColors.lightGrayColor,
            labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
            labelColor: AppColors.primaryColor,
            tabs: [
              Tab(
                child: Text(
                  "(LHE) - (DXB)",
                ),
              ),
              Tab(
                child: Text(
                  "(DXB) - (LHE)",
                ),
              ),
            ],
          )
        ],
      ),

      SizedBox(
        height: 20.h,
      ),

      // Tab Page View
      FlightDetailsWidget(
        tourModel: widget.flightModel.tours,
      ),

      if (isShowDetails) ...{
        SizedBox(
          height: 20.sp,
        ),
        _buildPropertiesWidget(),
        SizedBox(
          height: 15.sp,
        ),
        Divider(
          color: AppColors.borderColor,
        ),
        SizedBox(
          height: 15.sp,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Select flight Button
            ButtonWidget(
              text: S.of(context).select_flight,
              textStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                  ),
            ),

            _hideDetailsButton(),
          ],
        )
      }
    ];
  }

  _buildPropertiesWidget() {
    return Wrap(
      spacing: 10,
      runSpacing: 5.sp,
      children: [
        TagWidget(
          height: 30.h,
          title: "Economy Light",
          hasBorder: true,
          textColor: AppColors.black,
          padding: EdgeInsets.symmetric(
            horizontal: 12.sp,
            vertical: 5,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        TagWidget(
          height: 30.h,
          title: "1 x 20 kg",
          hasBorder: true,
          textColor: AppColors.black,
          padding: EdgeInsets.symmetric(
            horizontal: 12.sp,
            vertical: 5,
          ),
          icon: Icon(
            Icons.luggage,
            size: 20.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  // Show Details Button
  _showDetailsButton() {
    return Row(
      children: [
        Text(
          S.of(context).show_details,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
        ),
        Icon(
          Icons.keyboard_arrow_down_outlined,
          color: AppColors.primaryColor,
          size: 15.sp,
        )
      ],
    );
  }

  // Hide Details Button
  _hideDetailsButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isShowDetails = false;
        });
      },
      child: Row(
        children: [
          Text(
            S.of(context).hide_details,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
          ),
          Icon(
            Icons.keyboard_arrow_up_outlined,
            color: AppColors.primaryColor,
            size: 15.sp,
          )
        ],
      ),
    );
  }
}
