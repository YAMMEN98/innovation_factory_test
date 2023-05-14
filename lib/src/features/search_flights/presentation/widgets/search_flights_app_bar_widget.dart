import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';

class SearchFlightsAppBarWidget extends StatefulWidget {
  final Color? backgroundColor;

  const SearchFlightsAppBarWidget({Key? key, this.backgroundColor})
      : super(key: key);

  @override
  State<SearchFlightsAppBarWidget> createState() =>
      _SearchFlightsAppBarWidgetState();
}

class _SearchFlightsAppBarWidgetState extends State<SearchFlightsAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: widget.backgroundColor ?? AppColors.primaryColor,
      child: Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
          ),
          Stack(
            children: [
              // Background Image
              SvgPicture.asset(
                Helper.getSvgPath("search_flights_image.svg"),
              ),

              // Flight Details
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                  top: 10.h,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Arrow Back Button
                    IconButton(
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        size: 20.sp,
                        color: AppColors.white,
                      ),
                    ),

                    // Flight Details
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // From/To
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // From
                              Text(
                                "DXB",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),

                              SizedBox(
                                width: 12.w,
                              ),

                              SvgPicture.asset(
                                Helper.getSvgPath("move.svg"),
                                width: 20.sp,
                                height: 20.sp,
                              ),

                              SizedBox(
                                width: 12.w,
                              ),

                              // To
                              Text(
                                "LHE",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      color: AppColors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 5.h,
                          ),

                          // From/To Date
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              // From Date
                              Text(
                                HelperUi.formatNamedDateE(DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              ),

                              // -
                              Text(
                                " - ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                              ),

                              // To Date
                              Text(
                                HelperUi.formatNamedDateE(DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),

                          SizedBox(
                            height: 10.h,
                          ),

                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              // People Icon
                              Icon(
                                Icons.people,
                                size: 20.sp,
                                color: AppColors.white,
                              ),

                              SizedBox(
                                width: 10.w,
                              ),

                              Text(
                                "2 Adults, 3 Children",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.white,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    // Edit Icon
                    CircleAvatar(
                      radius: 25.sp,
                      backgroundColor: AppColors.white.withOpacity(0.1),
                      child: SvgPicture.asset(
                        Helper.getSvgPath(
                          "edit.svg",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
