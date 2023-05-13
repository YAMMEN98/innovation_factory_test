import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';

class FlightsPage extends StatefulWidget {
  const FlightsPage({Key? key}) : super(key: key);

  @override
  State<FlightsPage> createState() => _FlightsPageState();
}

class _FlightsPageState extends State<FlightsPage>
    with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      child: Text(""),
    );
  }
}
