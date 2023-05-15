import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
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

  // Variable Of Car Rental Filter
  final bool hasPickupLocation;
  final bool hasDropOffLocation;
  final bool hasFinalDestination;
  final bool isDifferentReturn;
  final bool isLoading;

  final Function({
    required String flyingFrom,
    required String flyingTo,
    required String departure,
    required String travelers,
    required String returnValue,
    required String whereAreYouGoing,
    required String checkIn,
    required String checkOut,
    required String guests,
    required String pickupLocation,
    required String dropOffLocation,
    required String finalDestination,
  }) searchCallback;

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
    this.hasPickupLocation = false,
    this.hasDropOffLocation = false,
    this.hasFinalDestination = false,
    this.isDifferentReturn = true,
    this.isLoading = false,
    required this.searchCallback,
  }) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _flyingFromController = TextEditingController();
  final TextEditingController _flyingToController = TextEditingController();
  final TextEditingController _departureController = TextEditingController();
  final TextEditingController _travelersController = TextEditingController();
  final TextEditingController _returnController = TextEditingController();
  final TextEditingController _whereAreYouGoingController =
      TextEditingController();
  final TextEditingController _checkInController = TextEditingController();
  final TextEditingController _checkOutController = TextEditingController();
  final TextEditingController _guestsController = TextEditingController();
  final TextEditingController _pickupLocationController =
      TextEditingController();
  final TextEditingController _dropOffLocationController =
      TextEditingController();
  final TextEditingController _finalDestinationController =
      TextEditingController();

  bool viewMore = false;

  @override
  void initState() {
    _departureController.text = HelperUi.formatNamedDate(DateTime.now());
    _returnController.text = HelperUi.formatNamedDate(DateTime.now());
    _checkInController.text = HelperUi.formatNamedDate(DateTime.now());
    _checkOutController.text = HelperUi.formatNamedDate(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Flying From/To
        _build_FlyingFromToFilter(),

        // Pickup/Drop-Off Location
        _buildPickupDropOffFilter(),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Final Destination
        Column(
          children: _buildFinalDestinationFilter(),
        ),

        // Departure And Return
        _buildDepartureAndReturnFilter(),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Travelers
        _buildTravelersFilter(),

        // Where Are You Going
        Column(
          children: _buildWhereAreYouFilter(),
        ),

        // Check In/Out
        _buildCheckInCheckOutFilter(),

        // Space
        SizedBox(
          height: 15.h,
        ),

        // Guests
        _buildGuestsFilter(),

        // View more/less
        if (viewMore) ...{
          if(widget.isLoading)...{
            AppLoader()
          }else...{
            ButtonWidget(
              onPressed: () {
                _callbackSearch();
              },
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
          },

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

  // Departure Filter
  Widget _buildDepartureFilter() {
    return Expanded(
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
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();

              DateTime selectedDateTime = HelperUi.formatNameStringToDate(_departureController.text.trim());

              DateTime? maxDate;
              if(widget.hasReturn){
                maxDate = HelperUi.formatNameStringToDate(_returnController.text.trim());
              }

              HelperUi.showDatePicker(
                context: context,
                initialSelectedDate: selectedDateTime,
                maxDate: maxDate,
                callback: (DateTime dateTime) {
                  _departureController.text = HelperUi.formatNamedDate(dateTime);

                  // If There is No Return So Should Equal Or Greater Than Departure
                  if(!widget.hasReturn){
                    _returnController.text = HelperUi.formatNamedDate(dateTime);
                  }
                  },
              );
            },
            child: TextFieldWidget(
              controller: _departureController,
              enabled: false,
              hintText: HelperUi.formatNamedDate(DateTime.now()),
              isUnderLineBorder: true,
              contentPadding: EdgeInsets.zero,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SvgPicture.asset(
                  Helper.getSvgPath("calendar.svg"),
                  width: 13.sp,
                  height: 13.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Return Filter
  Widget _buildReturnFilter() {
    return Expanded(
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
          GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();

              DateTime selectedDateTime = HelperUi.formatNameStringToDate(_returnController.text.trim());
              DateTime minDate  = HelperUi.formatNameStringToDate(_departureController.text.trim());

              HelperUi.showDatePicker(
                context: context,
                initialSelectedDate: selectedDateTime,
                minDate: minDate,
                callback: (DateTime dateTime) {
                  _returnController.text = HelperUi.formatNamedDate(dateTime);
                },
              );
            },
            child: TextFieldWidget(
              controller: _returnController,
              enabled: false,
              isUnderLineBorder: true,
              hintText: HelperUi.formatNamedDate(DateTime.now()),
              contentPadding: EdgeInsets.zero,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: SvgPicture.asset(
                  Helper.getSvgPath("calendar.svg"),
                  width: 13.sp,
                  height: 13.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Flying From/To Filter
  Widget _build_FlyingFromToFilter() {
    return Row(
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
                  controller: _flyingFromController,
                  hintText: "Dubai (DXB)",
                  isUnderLineBorder: true,

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
                  controller: _flyingToController,
                  isUnderLineBorder: true,
                  hintText: "Sharjah (SHJ)",

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
    );
  }

  // Pickup Drop Off Filter
  Widget _buildPickupDropOffFilter() {
    return Row(
      children: [
        // Pickup Location
        if (widget.hasPickupLocation) ...{
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).pick_uo_location,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                  controller: _pickupLocationController,
                  hintText: "Dubai (DXB)",
                  isUnderLineBorder: true,

                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset(
                      Helper.getImagePath("car.png"),
                      width: 20.sp,
                      height: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        },

        // Drop Off Location
        if (widget.hasDropOffLocation) ...{
          // Space
          SizedBox(
            width: 10.w,
          ),

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
                  controller: _dropOffLocationController,
                  isUnderLineBorder: true,
                  hintText: "Sharjah (SHJ)",

                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset(
                      Helper.getImagePath("car.png"),
                      width: 20.sp,
                      height: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        }
      ],
    );
  }

  List<Widget> _buildFinalDestinationFilter() {
    return <Widget>[
      if (widget.hasCarRentalFilter) ...{
        if (widget.isDifferentReturn) ...{
          if (widget.hasFinalDestination) ...{
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  S.of(context).final_destination,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                TextFieldWidget(
                  controller: _finalDestinationController,
                  enabled: false,
                  hintText: "Ras Al-Khaima (RAK)",
                  isUnderLineBorder: true,

                  contentPadding: EdgeInsets.zero,
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: SvgPicture.asset(
                      Helper.getSvgPath("calendar.svg"),
                      width: 13.sp,
                      height: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
            if (viewMore) ...{
              // Space
              SizedBox(
                height: 15.h,
              ),
            }
          },
        },
      },
    ];
  }

  Widget _buildDepartureAndReturnFilter() {
    return Row(
      children: [
        // Departure
        if (widget.hasCarRentalFilter) ...{
          if (widget.isDifferentReturn) ...{
            // On Way Selected
            if (!widget.hasFinalDestination) ...{
              if (widget.hasDeparture) ...{
                _buildDepartureFilter(),
              },
            } else ...{
              if (widget.hasDeparture && viewMore) ...{
                _buildDepartureFilter(),
              },
            },
          } else ...{
            if (widget.hasDeparture) ...{
              _buildDepartureFilter(),
            },
          },
        } else ...{
          if (widget.hasDeparture) ...{
            _buildDepartureFilter(),
          },
        },

        if (widget.hasCarRentalFilter) ...{
          if (widget.isDifferentReturn) ...{
            // On Way Selected
            if (!widget.hasFinalDestination) ...{
              if (widget.hasReturn) ...{
                // Space
                SizedBox(
                  width: 10.w,
                ),

                _buildReturnFilter(),
              },
            } else ...{
              if (widget.hasReturn && viewMore) ...{
                // Space
                SizedBox(
                  width: 10.w,
                ),

                _buildReturnFilter(),
              },
            },
          } else ...{
            if (widget.hasReturn) ...{
              // Space
              SizedBox(
                width: 10.w,
              ),

              _buildReturnFilter(),
            },
          }
        } else ...{
          if (widget.hasReturn) ...{
            // Space
            SizedBox(
              width: 10.w,
            ),

            _buildReturnFilter(),
          },
        },
      ],
    );
  }

  // Build Travelers Filter
  Widget _buildTravelersFilter() {
    if (widget.hasTravelers && viewMore) {
      return Column(
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
            controller: _travelersController,
            enabled: false,
            hintText: S.of(context).travelers_hint,
            isUnderLineBorder: true,

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
      );
    }
    return SizedBox();
  }

  // Build Where Are You Filter
  List<Widget> _buildWhereAreYouFilter() {
    if (widget.hasWhereAreYouGoing) {
      return <Widget>[
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
              controller: _whereAreYouGoingController,
              enabled: false,
              hintText: S.of(context).search_for_place,
              isUnderLineBorder: true,

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
      ];
    }
    return [];
  }

  // Build Check In And Check OutFilter
  Widget _buildCheckInCheckOutFilter() {
    return Row(
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
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();

                    DateTime selectedDateTime = HelperUi.formatNameStringToDate(_checkInController.text.trim());
                    DateTime maxDate = HelperUi.formatNameStringToDate(_checkOutController.text.trim());


                    HelperUi.showDatePicker(
                      context: context,
                      initialSelectedDate: selectedDateTime,
                      maxDate: maxDate,
                      callback: (DateTime dateTime) {
                        _checkInController.text = HelperUi.formatNamedDate(dateTime);
                      },
                    );
                  },
                  child: TextFieldWidget(
                    controller: _checkInController,
                    enabled: false,
                    hintText: HelperUi.formatNamedDate(DateTime.now()),
                    isUnderLineBorder: true,

                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SvgPicture.asset(
                        Helper.getSvgPath("calendar.svg"),
                        width: 13.sp,
                        height: 13.sp,
                      ),
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
                GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();

                    DateTime selectedDateTime = HelperUi.formatNameStringToDate(_checkOutController.text.trim());
                    DateTime minDate = HelperUi.formatNameStringToDate(_checkInController.text.trim());


                    HelperUi.showDatePicker(
                      context: context,
                      initialSelectedDate: selectedDateTime,
                      minDate: minDate,
                      callback: (DateTime dateTime) {
                        _checkOutController.text = HelperUi.formatNamedDate(dateTime);
                      },
                    );
                  },
                  child: TextFieldWidget(
                    controller: _checkOutController,
                    enabled: false,
                    isUnderLineBorder: true,
                    hintText: HelperUi.formatNamedDate(DateTime.now()),

                    contentPadding: EdgeInsets.zero,
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: SvgPicture.asset(
                        Helper.getSvgPath("calendar.svg"),
                        width: 13.sp,
                        height: 13.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        }
      ],
    );
  }

  // Build Guests Filter
  Widget _buildGuestsFilter() {
    if (widget.hasGuests && viewMore) {
      return Column(
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
            controller: _guestsController,
            enabled: false,
            hintText: S.of(context).travelers_hint,
            isUnderLineBorder: true,

            contentPadding: EdgeInsets.zero,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Icon(
                Icons.people,
                size: 20.sp,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          // Space
          SizedBox(
            height: 15.h,
          ),
        ],
      );
    }
    return SizedBox();
  }

  // Search Callback
  void _callbackSearch() {
    final String flyingFrom = _flyingFromController.text.trim();
    final String flyingTo = _flyingToController.text.trim();
    final String departure = HelperUi.formatToStandardDate(HelperUi.formatNameStringToDate(_departureController.text.trim())) ;
    final String travelers = _travelersController.text.trim().isEmpty?"0":_travelersController.text.trim();
    final String returnValue = HelperUi.formatToStandardDate(HelperUi.formatNameStringToDate(_returnController.text.trim())) ;
    final String whereAreYouGoing = _whereAreYouGoingController.text.trim();
    final String checkIn = HelperUi.formatToStandardDate(HelperUi.formatNameStringToDate(_checkInController.text.trim())) ;
    final String checkOut = HelperUi.formatToStandardDate(HelperUi.formatNameStringToDate(_checkOutController.text.trim())) ;
    final String guests = _guestsController.text.trim().isEmpty?"0":_guestsController.text.trim();
    final String pickupLocation = _pickupLocationController.text.trim();
    final String dropOffLocation = _dropOffLocationController.text.trim();
    final String finalDestination = _finalDestinationController.text.trim();
    widget.searchCallback.call(
      flyingFrom: flyingFrom,
      flyingTo: flyingTo,
      departure: departure,
      travelers: travelers,
      returnValue: returnValue,
      whereAreYouGoing: whereAreYouGoing,
      checkIn: checkIn,
      checkOut: checkOut,
      guests: guests,
      pickupLocation: pickupLocation,
      dropOffLocation: dropOffLocation,
      finalDestination: finalDestination,
    );
  }
}
