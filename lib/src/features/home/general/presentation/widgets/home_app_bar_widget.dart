import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/action_button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/circle_border_image_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/injections.dart';
import 'package:innovation_factory_test/src/features/auth/data/data_sources/locale/auth_shared_prefs.dart';

class HomeAppBarWidget extends StatefulWidget {
  const HomeAppBarWidget({Key? key}) : super(key: key);

  @override
  State<HomeAppBarWidget> createState() => _HomeAppBarWidgetState();
}

class _HomeAppBarWidgetState extends State<HomeAppBarWidget> {
  String name = defaultStr;

  @override
  void initState() {
    name = sl<AuthSharedPrefs>().getUser()?.user.firstName ?? defaultStr;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
        vertical: 24.h,
      ),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Image And Name
          Row(
            children: [
              // Profile Image
              CircleBorderImageWidget(
                image: Helper.getImagePath(
                  "profile_image.jpg",
                ),
              ),

              // Space
              SizedBox(
                width: 15.w,
              ),

              // Name
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome title
                  Row(
                    children: [
                      Text(
                        S.of(context).welcome,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grayColor,
                            ),
                      ),

                      // Space
                      SizedBox(
                        width: 3.w,
                      ),

                      SvgPicture.asset(
                        Helper.getSvgPath("waving.svg"),
                        width: 16.sp,
                        height: 16.sp,
                      )
                    ],
                  ),

                  // Name
                  Text(
                    name,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  )
                ],
              )
            ],
          ),

          // Notification And Drawer
          Row(
            children: [
              // Notifications
              ActionButtonWidget(
                onTap: () {},
                child: SvgPicture.asset(
                  Helper.getSvgPath("notifications.svg"),
                  width: 15.sp,
                  height: 15.sp,
                ),
              ),

              // Space
              SizedBox(
                width: 10.w,
              ),

              // Drawer
              ActionButtonWidget(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Scaffold.of(context).openDrawer();
                },
                child: SvgPicture.asset(
                  Helper.getSvgPath("drawer.svg"),
                  width: 15.sp,
                  height: 15.sp,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
