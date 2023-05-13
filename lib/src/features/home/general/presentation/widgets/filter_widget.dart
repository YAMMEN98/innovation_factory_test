import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';

class FilterWidget extends StatefulWidget {
  // Variable To Display Filter of (Flights, Hotels, Car Rental)
  final bool hasFlyingFilter;
  final bool hasHotelsFilter;
  final bool hasCarRentalFilter;

  // Variable Of Flights Filter
  final bool hasFlyingFrom;
  final bool haseFlyingTo;
  final bool hasDeparture;
  final bool hasTravelers;
  final bool hasReturn;

  // Variable Of Hotels Filter
  final bool hasWhereAreYouGoing;
  final bool hasCheckIn;
  final bool hasCheckOut;
  final bool hasGuests;

  final Function() searchCallback;

  const FilterWidget({
    Key? key,
    this.hasFlyingFilter = false,
    this.hasHotelsFilter = false,
    this.hasCarRentalFilter = false,
    this.hasFlyingFrom = false,
    this.haseFlyingTo = false,
    this.hasDeparture = false,
    this.hasTravelers = false,
    this.hasReturn = false,
    this.hasWhereAreYouGoing = false,
    this.hasCheckIn = false,
    this.hasCheckOut = false,
    this.hasGuests = false,
    required this.searchCallback,
  }) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  bool viewMore = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filters For Flights
        if (widget.hasFlyingFilter) ...{
          _buildFlightsFilter(),
        },

        // Filters For Hotels
        if (widget.hasHotelsFilter) ...{
          _buildHotelsFilter(),
        },

        // View more/less
        if (viewMore) ...{
          ButtonWidget(
            text: S.of(context).search,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
            icon: Icon(
              Icons.search,
              size: 20.sp,
              color: AppColors.white,
            ),
          ),

          SizedBox(
            height: 15.h,
          ),

          // View All Filters
          GestureDetector(
            onTap: () {
              setState(() {
                viewMore = !viewMore;
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.keyboard_arrow_up_outlined,
                  size: 25.sp,
                  color: AppColors.primaryColor,
                ),
                Text(
                  S.of(context).view_less,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                ),
              ],
            ),
          ),
        } else ...{
          // View Less Filters
          GestureDetector(
            onTap: () {
              setState(() {
                viewMore = !viewMore;
              });
            },
            child: Column(
              children: [
                Text(
                  S.of(context).view_more,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                      ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 25.sp,
                  color: AppColors.primaryColor,
                )
              ],
            ),
          )
        }
      ],
    );
  }

  // Flights Filter
  Widget _buildFlightsFilter() {
    return Column(
      children: [
        // Flying From/To
        Row(
          children: [
            // Flying From
            if (widget.hasFlyingFrom) ...{
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).flying_from,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      hintText: "Dubai (DXB)",
                      isUnderLineBorder: true,
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Icon(
                          Icons.flight_takeoff_outlined,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            },

            // Flying To
            if (widget.haseFlyingTo) ...{
              // Space
              SizedBox(
                width: 10.w,
              ),

              // Flying To
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).flying_to,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      isUnderLineBorder: true,
                      hintText: "Sharjah (SHJ)",
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Icon(
                          Icons.flight_land_outlined,
                          color: AppColors.primaryColor,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            }
          ],
        ),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Departure And Return
        Row(
          children: [
            // Departure
            if (widget.hasDeparture) ...{
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).departure,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      enabled: false,
                      hintText: HelperUi.formatNamedDate(DateTime.now()),
                      isUnderLineBorder: true,
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: SvgPicture.asset(
                          Helper.getSvgPath("calendar.svg"),
                          width: 13.w,
                          height: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            },

            if (widget.hasReturn) ...{
              // Space
              SizedBox(
                width: 10.w,
              ),

              // Return
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).return_flying,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      enabled: false,
                      isUnderLineBorder: true,
                      hintText: HelperUi.formatNamedDate(DateTime.now()),
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: SvgPicture.asset(
                          Helper.getSvgPath("calendar.svg"),
                          width: 13.w,
                          height: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            }
          ],
        ),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Travelers
        if (widget.hasTravelers && viewMore) ...{
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.of(context).travelers,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                enabled: false,
                hintText: S.of(context).travelers_hint,
                isUnderLineBorder: true,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Icon(
                      Icons.people,
                      size: 20.sp,
                      color: AppColors.primaryColor,
                    )),
              ),
              // Space
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        },
      ],
    );
  }

  // Hotels Filter
  Widget _buildHotelsFilter() {
    return Column(
      children: [
        // Where Are You Going
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).departure,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: 2.h,
            ),
            TextFieldWidget(
              enabled: false,
              hintText: S.of(context).search_for_place,
              isUnderLineBorder: true,
              textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
              contentPadding: EdgeInsets.zero,
              prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Icon(
                    Icons.pin_drop,
                    size: 20.sp,
                    color: AppColors.primaryColor,
                  )),
            ),
          ],
        ),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Check In/Out
        Row(
          children: [
            // Check In
            if (widget.hasCheckIn) ...{
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).check_in,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      hintText: HelperUi.formatNamedDate(DateTime.now()),
                      isUnderLineBorder: true,
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: SvgPicture.asset(
                          Helper.getSvgPath("calendar.svg"),
                          width: 13.w,
                          height: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            },

            // Check Out
            if (widget.hasCheckOut) ...{
              // Space
              SizedBox(
                width: 10.w,
              ),

              // Check Out
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).check_out,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    TextFieldWidget(
                      isUnderLineBorder: true,
                      hintText: HelperUi.formatNamedDate(DateTime.now()),
                      textStyle:
                          Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: SvgPicture.asset(
                          Helper.getSvgPath("calendar.svg"),
                          width: 13.w,
                          height: 13.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            }
          ],
        ),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Travelers
        if (widget.hasGuests && viewMore) ...{
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                S.of(context).guests,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(
                height: 2.h,
              ),
              TextFieldWidget(
                enabled: false,
                hintText: S.of(context).travelers_hint,
                isUnderLineBorder: true,
                textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Icon(
                      Icons.people,
                      size: 20.sp,
                      color: AppColors.primaryColor,
                    )),
              ),
              // Space
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        },
      ],
    );
  }
}
