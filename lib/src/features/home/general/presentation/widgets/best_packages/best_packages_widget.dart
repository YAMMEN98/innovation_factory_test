import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_card_web_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_card_widget.dart';

class BestPackagesWidget extends StatefulWidget {
  const BestPackagesWidget({Key? key}) : super(key: key);

  @override
  State<BestPackagesWidget> createState() => _BestPackagesWidgetState();
}

class _BestPackagesWidgetState extends State<BestPackagesWidget> {
  List<String> bestPackages = ["1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Best Package Title
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  S.of(context).best_packages,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              SizedBox(
                width: HelperUi.getHorizontalSpace(),
              ),
              Text(
                S.of(context).view_all,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
              ),
            ],
          ),
        ),

        // List Of Offers
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: bestPackages.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HelperUi.getHorizontalSpace(),
                vertical: 20.h,
              ),
              child: kIsWeb?BestPackageCardWebWidget():BestPackageCardWidget(),
            );
          }).toList()),
        )
      ],
    );
  }
}
