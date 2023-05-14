import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';

class HomeTabBarWidget extends StatefulWidget {
  final TabController tabController;

  const HomeTabBarWidget({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  @override
  State<HomeTabBarWidget> createState() => _HomeTabBarWidgetState();
}

class _HomeTabBarWidgetState extends State<HomeTabBarWidget> {
  @override
  void initState() {
    widget.tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12.sp,
      ),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.sp),
            topRight: Radius.circular(20.sp),
          )),
      child: TabBar(
        unselectedLabelColor: AppColors.lightGrayColor,
        labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
        labelColor: Theme.of(context).textTheme.bodyLarge!.color,
        labelPadding: EdgeInsets.only(
          bottom: 10.h,
          left: 5.sp,
          right: 5.sp,
        ),
        controller: widget.tabController,
        tabs: [
          // Flights
          _buildTabBar(
            title: S.of(context).flights,
            icon: SvgPicture.asset(
              Helper.getSvgPath("flights.svg"),
              width: 15.sp,
              height: 15.sp,
              color: widget.tabController.index == 0
                  ? AppColors.primaryColor
                  : AppColors.lightGrayColor,
            ),
            index: 0,
          ),

          // Hotels
          _buildTabBar(
            title: S.of(context).hotels,
            icon: SvgPicture.asset(
              Helper.getSvgPath("hotels.svg"),
              width: 15.sp,
              height: 15.sp,
              color: widget.tabController.index == 1
                  ? AppColors.primaryColor
                  : AppColors.lightGrayColor,
            ),
            index: 1,
          ),

          // Hotels
          _buildTabBar(
            title: S.of(context).car_rental,
            icon: SvgPicture.asset(
              Helper.getSvgPath("car_rental.svg"),
              width: 15.sp,
              height: 15.sp,
              color: widget.tabController.index == 2
                  ? AppColors.primaryColor
                  : AppColors.lightGrayColor,
            ),
            index: 2,
          ),
        ],
      ),
    );
  }

  // Tab Bar
  Widget _buildTabBar(
      {required Widget icon, required String title, required int index}) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon or Child
          icon,

          // Space
          SizedBox(
            width: 7.w,
          ),

          Flexible(
            child: Text(
              title,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
