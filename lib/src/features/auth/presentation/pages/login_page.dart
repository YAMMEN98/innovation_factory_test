import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/checkbox_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/validators/base_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/email_validator1.dart';
import 'package:innovation_factory_test/src/core/util/validators/password_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/required_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Email
  final TextEditingController _emailController = TextEditingController();
  bool _emailValidator = true;

  // Password
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordValidator = true;

  // Form
  final _formKey = GlobalKey<FormState>();

  bool _isRememberMeChecked = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      topSafeArea: true,
      child: Container(
        padding:
            EdgeInsets.only(left: 21.w, right: 16.w, top: 50.h, bottom: 33.h),
        margin: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: kToolbarHeight,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // User Placeholder Image
              Center(
                child: SvgPicture.asset(
                  Helper.getSvgPath("user_placeholder_image.svg"),
                  width: 50.sp,
                  height: 50.sp,
                ),
              ),

              // Space
              SizedBox(
                height: 20.h,
              ),

              // Login Title
              Text(
                S.of(context).login_to_existing_user,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                    ),
                textAlign: TextAlign.center,
              ),

              // Space
              SizedBox(
                height: 40.h,
              ),

              // Email Text Field
              _buildEmailTextField(),

              // Space
              SizedBox(
                height: 12.h,
              ),

              // Password Text Field
              _buildPasswordTextField(),

              // Space
              SizedBox(
                height: 22.h,
              ),

              // Remember Me And Forget Password
              _buildRememberMeAndForgetPassword(),

              // Space
              SizedBox(
                height: 42.h,
              ),

              // Login Button
              Center(
                child: ButtonWidget(
                  text: S.of(context).login,
                  verticalPadding: 10.h,
                  horizontalPadding: 30.w,
                  shadowColor: AppColors.primaryColor.withOpacity(0.5),
                  elevation: 20,
                ),
              ),

              // Space
              SizedBox(
                height: 30.h,
              ),

              // Don't Have an Account And Create Account
              _buildDoNotHaveAnAccountAndCreateAccount(),
            ],
          ),
        ),
      ),
    );
  }

  // Email Text Filed Widget
  Widget _buildEmailTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email title
        Text(
          "${S.of(context).email} *",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.start,
        ),

        // Space
        SizedBox(
          height: 8.h,
        ),

        TextFieldWidget(
          controller: _emailController,
          hintText: emailHint,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [RequiredValidator(), EmailValidator()],
              _emailValidator,
            );
          },
        ),
      ],
    );
  }

  // Email Password Widget
  Widget _buildPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email title
        Text(
          "${S.of(context).password} *",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
              ),
          textAlign: TextAlign.start,
        ),

        // Space
        SizedBox(
          height: 8.h,
        ),

        TextFieldWidget(
          controller: _passwordController,
          hintText: passwordHint,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [RequiredValidator(), PasswordValidator()],
              _passwordValidator,
            );
          },
        ),
      ],
    );
  }

  // Remember Me and Forget Password
  Widget _buildRememberMeAndForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Remember Me
        Row(
          children: [
            // Remember Me
            CustomCheckboxWidget(
              isChecked: _isRememberMeChecked,
              onChanged: (value) {
                setState(() {
                  _isRememberMeChecked = value;
                });
              },
            ),

            // Space
            SizedBox(
              width: 14.w,
            ),

            Text(
              S.of(context).remember_login_info,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.grayColor,
                  ),
            )
          ],
        ),

        // Forget Password
        Flexible(
          child: Text(
            S.of(context).forget_password,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
          ),
        )
      ],
    );
  }

  // Don't Have an Account And Create Account
  Widget _buildDoNotHaveAnAccountAndCreateAccount() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          // Don't Have An Account Title
          TextSpan(
              text: S.of(context).do_not_have_an_account,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  )),

          // Create Account Title
          TextSpan(
              text: S.of(context).create_account,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  )),
        ]),
      ),
    );
  }
}
