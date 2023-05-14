import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_place_card_web_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_place_card_widget.dart';

class BestPlacesWidget extends StatefulWidget {
  const BestPlacesWidget({Key? key}) : super(key: key);

  @override
  State<BestPlacesWidget> createState() => _BestPlacesWidgetState();
}

class _BestPlacesWidgetState extends State<BestPlacesWidget> {
  List<String> bestPlaces = ["1", "2"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Best Places Title
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                S.of(context).best_place,
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

        // List Of Offers
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: bestPlaces.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HelperUi.getHorizontalSpace(),
                vertical: 20.h,
              ),
              child: kIsWeb?BestPlaceCardWebWidget():BestPlaceCardWidget(),
            );
          }).toList()),
        )
      ],
    );
  }
}
