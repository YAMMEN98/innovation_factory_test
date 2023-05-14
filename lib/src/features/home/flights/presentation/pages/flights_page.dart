import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/home/flights/presentation/bloc/flights_bloc.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_places_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/filter_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limited_offers_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/select_button_widget.dart';

class FlightsPage extends StatefulWidget {
  const FlightsPage({Key? key}) : super(key: key);

  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage>
    with TickerProviderStateMixin {
  FlightsBloc _bloc = FlightsBloc();

  ScrollController scrollController = ScrollController();
  late TabController tabController;

  // Flight Type
  int selectedFlightTypeIndex = 1;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    _bloc.add(OnChangingSelectedFlightTypeEvent(selectedFlightTypeIndex));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Space
            SizedBox(
              height: 20.h,
            ),

            // Flight Type
            Center(
                child: BlocConsumer<FlightsBloc, FlightsState>(
              buildWhen: (previous, current) {
                return current is ChangeSelectedFlightState;
              },
              bloc: _bloc,
              builder: (context, state) {
                if (state is ChangeSelectedFlightState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Business
                        SelectButtonWidget(
                          title: S.of(context).business,
                          titleColor: AppColors.grayColor,
                          isSelected: state.selectedFlightTypeIndex == 0,
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 20.sp,
                            color: AppColors.grayColor,
                          ),
                          onTap: () {},
                        ),

                        SizedBox(
                          width: 10.w,
                        ),

                        // One Way
                        SelectButtonWidget(
                          title: S.of(context).one_way,
                          isSelected: state.selectedFlightTypeIndex == 1,
                          onTap: () {
                            _bloc.add(OnChangingSelectedFlightTypeEvent(1));
                          },
                        ),

                        SizedBox(
                          width: 10.w,
                        ),

                        // Rounded Trip
                        SelectButtonWidget(
                          title: S.of(context).round_trip,
                          isSelected: state.selectedFlightTypeIndex == 2,
                          onTap: () {
                            _bloc.add(OnChangingSelectedFlightTypeEvent(2));
                          },
                        ),
                      ],
                    ),
                  );
                }
                return AppLoader();
              },
              listener: (context, state) {
                if (state is ChangeSelectedFlightState) {
                  selectedFlightTypeIndex = state.selectedFlightTypeIndex;
                }
              },
            )),

            // Space
            SizedBox(
              height: 20.h,
            ),

            // Filter
            BlocBuilder<FlightsBloc, FlightsState>(
              bloc: _bloc,
              builder: (context, state) {
                return FilterWidget(
                  hasFlyingFilter: true,
                  hasFlyingFrom: true,
                  haseFlyingTo: true,
                  hasDeparture: true,
                  hasReturn: selectedFlightTypeIndex == 2,
                  hasTravelers: true,
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
      ),
    ));
  }
}
