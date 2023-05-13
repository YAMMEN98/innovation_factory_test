import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_packages/best_packages_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/best_places/best_places_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/filter_widget.dart';
import 'package:innovation_factory_test/src/features/home/general/presentation/widgets/limited_offers/limited_offers_widget.dart';
import 'package:innovation_factory_test/src/features/home/hotels/presentation/bloc/hotels_bloc.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> with TickerProviderStateMixin {
  HotelsBloc _bloc = HotelsBloc();

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
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Filter
            FilterWidget(
              hasHotelsFilter: true,
              hasWhereAreYouGoing: true,
              hasCheckIn: true,
              hasCheckOut: true,
              hasGuests: true,
              searchCallback: (flyingFrom,
                  flyingTo,
                  departure,
                  travelers,
                  returnValue,
                  whereAreYouGoing,
                  checkIn,
                  checkOut,
                  guest,
                  pickupLocation,
                  dropOffLocation,
                  finalDestination) {},
            ),

            // Space
            SizedBox(
              height: 20.h,
            ),

            // Limited Offers
            LimitedOffersWidget(),

            // Space
            SizedBox(
              height: 20.h,
            ),

            // Best Places
            BestPlacesWidget(),

            // Space
            SizedBox(
              height: 20.h,
            ),

            // Best Packages
            BestPackagesWidget(),
          ],
        ),
      ),
    ));
  }
}
