import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/core/util/router.dart';
import 'package:innovation_factory_test/src/features/home/flights/presentation/bloc/flights_bloc.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_places_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/filter_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limited_offers_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/select_button_widget.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/entities/filtering_flights_page_params.dart';

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
        child: SingleChildScrollView(
      child: Column(
        children: [

          // Flight Type
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: Center(
                child: BlocConsumer<FlightsBloc, FlightsState>(
              buildWhen: (previous, current) {
                return current is ChangeSelectedFlightState;
              },
              bloc: _bloc,
              builder: (context, state) {
                if (state is ChangeSelectedFlightState) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.sp,
                      vertical: 20.sp
                    ),
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
          ),



          // Filter
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
            ),
            child: BlocConsumer<FlightsBloc, FlightsState>(
              bloc: _bloc,
              builder: (context, state) {
                return FilterWidget(
                  hasFlyingFilter: true,
                  hasFlyingFrom: true,
                  hasFlyingTo: true,
                  hasDeparture: true,
                  hasReturn: selectedFlightTypeIndex == 2,
                  hasAdults: true,
                  hasChildren: true,
                  isLoading: state is LoadingFilteringFlightsState,
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
                    required String adults,
                    required String children,
                    required String infants,
                    required String whereAreYouGoing,
                  }) {
                    _bloc.add(
                      OnFilteringFlightsEvent(
                        type: "Return",
                        classString: "Economy",
                        adults: int.tryParse(adults)??0,
                        children: int.tryParse(children)??0,
                        infants: int.tryParse(infants)??0,
                        departureDate: departure,
                        returnDate: returnValue,
                        airportOriginCode: flyingFrom,
                        airportDestinationCode: flyingTo,
                      ),
                    );
                  },
                );
              },
              listener: (context, state) {
                if (state is FailureFilteringFlightsState) {
                  HelperUi.showSnackBar(
                    context,
                    state.errorMessage,
                    type: ToastTypeEnum.error,
                  );
                } else if (state is SuccessFilteringFlightsState) {
                  Navigator.pushNamed(
                    context,
                    AppPageRouteName.searchFlights.name,
                    arguments: state.pageParams,
                  );
                }
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
