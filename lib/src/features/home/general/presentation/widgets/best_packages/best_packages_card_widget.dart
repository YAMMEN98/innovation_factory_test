import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/rate_number_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';

class BestPackageCardWidget extends StatefulWidget {
  const BestPackageCardWidget({Key? key}) : super(key: key);

  @override
  State<BestPackageCardWidget> createState() => _BestPackageCardWidgetState();
}

class _BestPackageCardWidgetState extends State<BestPackageCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image
          Container(
            width: 150.w,
            height: 200.h,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(20.sp),
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Stack(
                children: [
                  Image.asset(
                    Helper.getImagePath("package_image.png"),
                    fit: BoxFit.fill,
                    width: 170.w,
                    height: 250.h,
                  ),

                  // Shadow
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.darkFontColor.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.6, 0.9],
                        ),
                      ),
                    ),
                  ),

                  // Rate And Favorite
                  Positioned(
                    top: 12.h,
                    left: 15.w,
                    right: 8.w,
                    bottom: 15.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RateNumberWidget(
                              rateTitle: "4.9",
                              rateValue: 0.5,
                            ),

                            SizedBox(
                              width: 5.w,
                            ),

                            // Favorite
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: isFavorite
                                  ? AppColors.white
                                  : AppColors.transparent,
                              child: FavoriteButton(
                                iconSize: 20.sp,
                                isFavorite: isFavorite,
                                valueChanged: (_isFavorite) {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  print('Is Favorite $_isFavorite)');
                                },
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                            vertical: 7.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.white,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.sp),
                              topLeft: Radius.circular(10.sp),
                              bottomRight: Radius.circular(10.sp),
                            ),
                          ),
                          child: Text(
                            "\$2,400",
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 9.h,
          ),

          Text(
            "Taj Mehal",
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            textAlign: TextAlign.start,
          ),

          SizedBox(
            height: 9.h,
          ),

          Text(
            "Agra, India",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayColor,
                ),
            textAlign: TextAlign.start,
          ),

          SizedBox(
            height: 9.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Date
              Flexible(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Helper.getSvgPath("calendar.svg"),
                      width: 13.w,
                      height: 13.w,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(
                        "4D/2N",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grayColor,
                            ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                width: 5.w,
              ),

              // People
              Flexible(
                child: Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 20.sp,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Flexible(
                      child: Text(
                        "${S.of(context).people}: 8",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.grayColor,
                            ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
