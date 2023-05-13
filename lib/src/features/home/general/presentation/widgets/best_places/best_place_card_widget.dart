import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/rate_number_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';

class BestPlaceCardWidget extends StatefulWidget {
  const BestPlaceCardWidget({Key? key}) : super(key: key);

  @override
  State<BestPlaceCardWidget> createState() => _BestPlaceCardWidgetState();
}

class _BestPlaceCardWidgetState extends State<BestPlaceCardWidget> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
              Helper.getImagePath("burj_khalifa.jpeg"),
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
                    stops: const [0.7, 0.9],
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        backgroundColor: isFavorite?
                        AppColors.white:
                        AppColors.transparent,
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

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Burj Khalifa",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),

                      SizedBox(
                        height: 3.h,
                      ),

                      RichText(text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$238 ",
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),

                          TextSpan(
                            text: "/ Per person",
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ]
                      ),)
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
