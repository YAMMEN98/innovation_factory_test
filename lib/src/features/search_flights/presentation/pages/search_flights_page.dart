import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/action_button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_places_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/filter_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limited_offers_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/select_button_widget.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/bloc/search_flights_bloc.dart';
import 'package:innovation_factory_test/src/features/search_flights/presentation/widgets/search_flights_app_bar_widget.dart';

class SearchFlightsPage extends StatefulWidget {
  const SearchFlightsPage({Key? key}) : super(key: key);

  @override
  State<SearchFlightsPage> createState() => _SearchFlightsPageState();
}

class _SearchFlightsPageState extends State<SearchFlightsPage> with TickerProviderStateMixin {
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
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Search Flights App Bar
              SearchFlightsAppBarWidget(),


              // Available Flights And Filters
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 30.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Flights Available
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Available Flights
                        Row(
                          children: [
                            Text(
                              "69 Flights",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,

                              ),
                            ),

                            Text(
                              " Available",
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w400,

                              ),
                            ),
                          ],
                        ),

                        // Filter Button
                        ActionButtonWidget(
                          onTap: (){},
                            child: SvgPicture.asset(
                              Helper.getSvgPath("filter.svg"),
                              width: 20.w,
                              height: 20.w,
                            ),
                          backgroundColor: AppColors.primaryColor,
                          borderRadius: 100,
                        ),





                      ],
                    ),


                    SizedBox(
                      height: 15.h,
                    ),


                    // DropDown Button
                    SingleChildScrollView(
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
                    )
                  ],
                ),
              )

            ],
          ),
        ));
  }
}
