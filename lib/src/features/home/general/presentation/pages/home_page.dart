import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/features/home/car_rental/presentation/pages/car_rental_page.dart';
import 'package:innovation_factory_test/src/features/home/flights/presentation/pages/flights_page.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/home_app_bar_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/home_tab_bar_widget.dart';
import 'package:innovation_factory_test/src/features/home/hotels/presentation/pages/hotels_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // App Bar
            SliverToBoxAdapter(
              child: HomeAppBarWidget(),
            ),

            // Where next title
            SliverToBoxAdapter(
              child: Container(
                height: 200.h,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Image
                    SvgPicture.asset(
                      Helper.getSvgPath("home_header_image.svg"),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                        top: 30.h,
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Where next title
                          Text(
                            S.of(context).where_next,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                          ),

                          // Tab Bar
                          HomeTabBarWidget(
                            tabController: tabController,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            // Flights Page
            FlightsPage(),

            // Hotels Page
            HotelsPage(),

            // Car Rental Page
            CarRentalPage(),
          ],
        ),
      ),
    );
  }
}
