import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/switch_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/presentation/bloc/car_rental_bloc.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/presentation/bloc/filter_cubit/filter_cubit.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_places_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/filter_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limited_offers_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/select_button_widget.dart';

class CarRentalPage extends StatefulWidget {
  const CarRentalPage({Key? key}) : super(key: key);

  @override
  State<CarRentalPage> createState() => _CarRentalPageState();
}

class _CarRentalPageState extends State<CarRentalPage>
    with TickerProviderStateMixin {
  CarRentalBloc _bloc = CarRentalBloc();
  FilterCubit _filterCubit = FilterCubit();

  ScrollController scrollController = ScrollController();
  late TabController tabController;

  // Is Different Return
  bool isDifferentReturn = true;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    // _bloc.add(OnChangingSelectedCarRentalTypeEvent(selectedCarRentalTypeIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Space
              SizedBox(
                height: 20.h,
              ),

              // CarRental Type
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: Center(
                    child: BlocBuilder<FilterCubit, FilterState>(
                  bloc: _filterCubit,
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: _filterCubit.selectedCarTripType == 1
                          ? MainAxisAlignment.spaceBetween
                          : MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 10.w,
                                ),

                                // One Way
                                SelectButtonWidget(
                                  title: S.of(context).one_way,
                                  isSelected: _filterCubit.selectedCarTripType == 0,
                                  onTap: () {
                                    _filterCubit.changeCarRentalType(0);
                                  },
                                ),

                                SizedBox(
                                  width: 10.w,
                                ),

                                // Rounded Trip
                                SelectButtonWidget(
                                  title: S.of(context).round_trip,
                                  isSelected: _filterCubit.selectedCarTripType == 1,
                                  onTap: () {
                                    _filterCubit.changeCarRentalType(1);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (_filterCubit.selectedCarTripType == 1) ...{
                          SizedBox(
                            width: 10.w,
                          ),
                          Row(
                            children: [
                              SwitchWidget(
                                value: _filterCubit.isDifferentReturn,
                                callback: (value) {
                                  _filterCubit.changeIsDifferentReturn(value);
                                },
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text(
                                S.of(context).different_return,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.grayColor,
                                    ),
                              ),
                            ],
                          ),
                        }
                      ],
                    );
                  },
                )),
              ),

              // Space
              SizedBox(
                height: 20.h,
              ),

              // Filter
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                ),
                child: BlocBuilder<FilterCubit, FilterState>(
                  bloc: _filterCubit,
                  builder: (context, state) {
                    return FilterWidget(
                      hasCarRentalFilter: true,
                      hasPickupLocation: true,
                      hasDropOffLocation: true,
                      hasDeparture: true,
                      hasReturn: _filterCubit.selectedCarTripType != 0,
                      hasFinalDestination: _filterCubit.selectedCarTripType == 1,
                      isDifferentReturn: _filterCubit.isDifferentReturn,
                      searchCallback: ({
                        required String checkIn,
                        required String checkOut,
                        required String departure,
                        required String dropOffLocation,
                        required String finalDestination,
                        required String flyingFrom,
                        required String flyingTo,
                        required String guests,
                        required String pickupLocation,
                        required String returnValue,
                        required String travelers,
                        required String whereAreYouGoing,
                      }) {
                        Navigator.pushNamed(context, "/search_flights_page");
                      },
                    );
                  },
                ),
              ),

              // Space
              SizedBox(
                height: 20.h,
              ),

              // Limited Offers
              LimitedOffersWidget(),

              // Space
              SizedBox(
                height: 20.h,
              ),

              // Best Places
              BestPlacesWidget(),

              // Space
              SizedBox(
                height: 20.h,
              ),

              // Best Packages
              BestPackagesWidget(),
            ],
          ),
        ));
  }
}
