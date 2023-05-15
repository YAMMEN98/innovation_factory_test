import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/action_button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/select_button_widget.dart';
import 'package:innovation_factory_test/src/features/search_flights/domain/entities/filtering_flights_page_params.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/bloc/search_flights_bloc.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/widgets/search_flights_app_bar_widget.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/widgets/trip_card_widget.dart';

class SearchFlightsPage extends StatefulWidget {
  final FilteringFlightsPageParams params;

  const SearchFlightsPage({Key? key, required this.params}) : super(key: key);

  @override
  State<SearchFlightsPage> createState() => _SearchFlightsPageState();
}

class _SearchFlightsPageState extends State<SearchFlightsPage>
    with TickerProviderStateMixin {
  SearchFlightsBloc _bloc = SearchFlightsBloc();

  ScrollController scrollController = ScrollController();
  late TabController tabController;

  // Flight Type
  int selectedFlightTypeIndex = 1;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        topSafeArea: false,
        child: Column(
          children: [
            // Search Flights App Bar
            SearchFlightsAppBarWidget(
              flyingFrom: widget.params.flyingFrom,
              flyingTo: widget.params.flyingTo,
              departureDate: widget.params.departureDate,
              returnDate: widget.params.returnDate,
              adults: widget.params.adults,
              children: widget.params.children,
            ),

            // Available Flights And Filters
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20.sp,
                  ),

                  // Flights Available
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Available Flights
                        Row(
                          children: [
                            Text(
                              "${widget.params.flights.length} ${S.of(context).flights}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            Text(
                              " ${S.of(context).available}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ],
                        ),

                        // Filter Button
                        ActionButtonWidget(
                          onTap: () {},
                          child: SvgPicture.asset(
                            Helper.getSvgPath("filter.svg"),
                            width: 15.w,
                            height: 15.w,
                          ),
                          backgroundColor: AppColors.primaryColor,
                          borderRadius: 100,
                          padding: EdgeInsets.all(8.sp),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 6.h,
                  ),

                  // DropDown Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Cheap Price
                          SelectButtonWidget(
                            title: S.of(context).cheap_price,
                            titleColor: AppColors.grayColor,
                            isSelected: false,
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

                          // Stop Include
                          SelectButtonWidget(
                            title: S.of(context).stop_include,
                            titleColor: AppColors.grayColor,
                            isSelected: false,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 20.sp,
                              color: AppColors.grayColor,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20.sp,
                  ),

                  // Flight Observer
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      itemBuilder: (context, index) {
                        return CardTripWidget(
                          flightModel: widget.params.flights[index],
                          adults: widget.params.adults,
                          children: widget.params.children,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.sp,
                        );
                      },
                      itemCount: widget.params.flights.length,
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 10.sp,
            ),
          ],
        ),
    );
  }
}
