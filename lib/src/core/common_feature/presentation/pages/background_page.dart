import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/app_drawer_page.dart';

import '../../../util/helper/helper.dart';

class BackgroundPage extends StatefulWidget {
  final Widget child;
  final bool isImage;
  final bool withDrawer;
  final Function(String coin)? drawerCallBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ValueNotifier<double>? dyValueNotifier;
  final bool isMoving;
  final bool tradeBackground;
  final bool topSafeArea;
  final bool bottomSafeArea;

  const BackgroundPage({
    required this.child,
    this.withDrawer = false,
    this.isImage = false,
    this.drawerCallBack,
    this.scaffoldKey,
    Key? key,
    this.dyValueNotifier,
    this.isMoving = false,
    this.tradeBackground = false,
    this.topSafeArea = true,
    this.bottomSafeArea = true,
  }) : super(key: key);

  @override
  State<BackgroundPage> createState() => _BackgroundPageState();
}

class _BackgroundPageState extends State<BackgroundPage> {
  // final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  bool isCallFromDrawer = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (widget.isImage) ...{
            SvgPicture.asset(
              Helper.getSvgPath(
                "login_background.svg",
              ),
              width: 100,
              height: 100,
            ),
          },
          Scaffold(
            key: widget.scaffoldKey,
            backgroundColor: Colors.transparent,
            resizeToAvoidBottomInset: true,
            onDrawerChanged: (isOpened) {
              if (!isOpened) {
                if (!isCallFromDrawer) {
                  if (widget.drawerCallBack != null) {
                    widget.drawerCallBack!("");
                  }
                }
                isCallFromDrawer = false;
              }
            },
            drawer: widget.withDrawer
                ? Drawer(
                    width: 0.7.w,
                    child: AppDrawerPage(),
                  )
                : null,
            body: SafeArea(
              bottom: widget.bottomSafeArea,
              top: widget.topSafeArea,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
