import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/features/booking_flight/presentation/bloc/flight_booking_bloc.dart';
import 'package:innovation_factory_test/src/features/booking_flight/presentation/widgets/flight_booking_app_bar_widget.dart';
import 'package:innovation_factory_test/src/features/booking_flight/presentation/widgets/flight_booking_steps_widget.dart';
import 'package:innovation_factory_test/src/features/booking_flight/presentation/widgets/passenger_card_widget.dart';

class FlightBookingPage extends StatefulWidget {
  final int adults;
  final int children;

  const FlightBookingPage(
      {Key? key, required this.adults, required this.children})
      : super(key: key);

  @override
  State<FlightBookingPage> createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage>
    with TickerProviderStateMixin {
  FlightBookingBloc _bloc = FlightBookingBloc();

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
      topSafeArea: false,
      child: Column(
        children: [
          // Flight Booking App Bar
          FlightBookingAppBarWidget(
            title: S
                .of(context)
                .your_flight_booking,
          ),

          // Steps
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 10.sp,
            ),
            child: FlightBookingStepsWidget(),
          ),

          // List Of Passengers
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 20.sp,
              ),
              child: Column(
                children: [

                  for(int i=0;i<widget.adults; i++)...{
                    PassengerCardWidget(
                      index: i+1,
                      isAdult: true,
                      isLead: i==0,
                    ),
                  },


                  for(int i=0;i<widget.children; i++)...{
                    PassengerCardWidget(
                      index: i+1,
                      isAdult: false,
                      isLead: false,
                    ),
                  },
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
