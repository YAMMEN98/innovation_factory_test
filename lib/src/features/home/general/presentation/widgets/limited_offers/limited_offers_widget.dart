import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limit_offer_card_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limit_offer_card_widget_web.dart';

class LimitedOffersWidget extends StatefulWidget {
  const LimitedOffersWidget({Key? key}) : super(key: key);

  @override
  State<LimitedOffersWidget> createState() => _LimitedOffersWidgetState();
}

class _LimitedOffersWidgetState extends State<LimitedOffersWidget> {
  List<String> offers = ["1", "2"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Limited Offers Title
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  S.of(context).limited_offers,
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
              children: offers.map((e) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HelperUi.getHorizontalSpace(),
                vertical: 20.h,
              ),
              child: kIsWeb?LimitedOfferCardWebWidget():LimitedOfferCardWidget(),
            );
          }).toList()),
        )
      ],
    );
  }
}
