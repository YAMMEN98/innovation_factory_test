import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/features/intro/presentation/bloc/intro_bloc.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late IntroBloc _bloc;

  @override
  void initState() {
    _bloc = IntroBloc();

    Future.delayed(
      Duration(seconds: 2),
      () {
        _bloc.add(OnCheckUserEvent());

        _bloc.stream.listen((state) {
          if (state is SuccessCheckUserStatusState) {
            if (state.isLoggedIn) {
              Navigator.pushReplacementNamed(context, "/home_page");
            } else {
              Navigator.pushReplacementNamed(context, "/login_page");
            }
          }
        });
      },
    );

    super.initState();
  }


  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child: SvgPicture.asset(
            Helper.getSvgPath("flight.svg"),
            width: 100.w,
            height: 100.h,
          ),
        ),
      ),
    );
  }
}
