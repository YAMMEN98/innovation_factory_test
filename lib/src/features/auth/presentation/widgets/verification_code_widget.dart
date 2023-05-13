import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/bloc/auth_bloc.dart';

import 'pin_code_text_field_widget.dart';

class VerificationCodeWidget extends StatefulWidget {
  final int userId;
  final Function? callback;
  final EdgeInsets contentPadding;
  final bool isRememberMe;

  const VerificationCodeWidget({Key? key, required this.contentPadding, this.callback, required this.userId, required this.isRememberMe}) : super(key: key);

  @override
  State<VerificationCodeWidget> createState() => _VerificationCodeWidgetState();
}

class _VerificationCodeWidgetState extends State<VerificationCodeWidget> {
  AuthBloc _bloc = AuthBloc();

  TextEditingController pinCodeController = TextEditingController();
  bool _isValidPin = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: widget.contentPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Verification Code Icon
                SvgPicture.asset(
                  Helper.getSvgPath("verification_code_icon.svg"),
                  width: 80.h,
                  height: 80.h,
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Title
                Text(
                  S.of(context).verify_code,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                  textAlign: TextAlign.center,
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Sub Title
                Text(
                  S.of(context).we_sent_an_otp,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Content
                PinCodeTextFieldWidget(
                  pinCodeController: pinCodeController,
                  onChange: (value) {
                    setState(() {
                      if (value.isNotEmpty && value.length == 6) {
                        _isValidPin = true;
                      } else {
                        _isValidPin = false;
                      }
                    });
                  },
                ),

                // Space
                SizedBox(
                  height: HelperUi.getVerticalSpace(),
                ),

                // Validate Button
                Center(
                  child: BlocConsumer<AuthBloc, AuthState>(
                    bloc: _bloc,
                    listener: (context, state) {
                      if(state is ErrorVerificationCodeState){
                        HelperUi.showSnackBar(context, state.errorMsg, type: ToastTypeEnum.error);
                      }else if(state is SuccessVerificationCodeState){
                        Navigator.pushNamedAndRemoveUntil(context, "/home_page", (route) => false);
                        HelperUi.showSnackBar(context, S.of(context).welcome_on_app, type: ToastTypeEnum.success);
                      }
                    },
                    builder: (context, state) {
                      if(state is LoadingVerificationCodeState){
                        return AppLoader();
                      }
                      return ButtonWidget(
                        horizontalPadding: 20.w,
                        text: S.of(context).validate,
                        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                        onPressed: () async {
                          if(_isValidPin){
                            _bloc.add(OnVerificationEvent(
                              userId: widget.userId,
                              otp: int.tryParse(pinCodeController.text.trim())??0,
                              deviceType: Helper.getDeviceType().name,
                              app: Helper.getAppName(),
                              isRememberMe: widget.isRememberMe,

                            ));
                          }
                        },
                      );
                    },
                  )
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
