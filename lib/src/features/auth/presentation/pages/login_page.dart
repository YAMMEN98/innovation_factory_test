import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/checkbox_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/core/util/validators/base_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/email_validator1.dart';
import 'package:innovation_factory_test/src/core/util/validators/required_validator.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/widgets/verification_code_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthBloc _bloc = AuthBloc();

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
      isImage: true,
      child: SingleChildScrollView(
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
                  child: BlocConsumer<AuthBloc, AuthState>(
                    bloc: _bloc,
                    listener: (context, state) {
                      if (state is ErrorLoginState) {
                        HelperUi.showSnackBar(context, state.errorMsg,
                            type: ToastTypeEnum.error);
                      } else if (state is SuccessLoginState) {
                        showVerificationCodeDialog(state.userId);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingLoginState) {
                        return AppLoader();
                      }

                      return ButtonWidget(
                        text: S.of(context).login,
                        verticalPadding: 15.sp,
                        horizontalPadding: 30.w,
                        shadowColor: AppColors.shadowColor,
                        elevation: 20,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login();
                          }
                        },
                      );
                    },
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
          keyboardType: TextInputType.emailAddress,
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
          isPassword: true,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [RequiredValidator()],
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
                ),
          ),

          // Create Account Title
          TextSpan(
            text: S.of(context).create_account,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, "/register_page");
              },
          ),
        ]),
      ),
    );
  }

  // Login Method
  void login() {
    // Close Keyboard
    FocusScope.of(context).unfocus();

    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    _bloc.add(
      OnLoggingInEvent(
        email,
        password,
      ),
    );
  }

  // Verification Code Dialog
  void showVerificationCodeDialog(int userId) {
    HelperUi.showCustomDialog(
      context,
      VerificationCodeWidget(
        userId: userId,
        contentPadding:
            EdgeInsets.only(top: 30.h, bottom: 21.h, left: 21.w, right: 21.w),
        callback: () {},
        isRememberMe: _isRememberMeChecked,
      ),
    );
  }
}
