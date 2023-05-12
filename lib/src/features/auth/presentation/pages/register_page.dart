import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/checkbox_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/general_dialog_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/core/util/validators/base_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/email_validator1.dart';
import 'package:innovation_factory_test/src/core/util/validators/match_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/password_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/required_validator.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Full Name
  final TextEditingController _fullNameController = TextEditingController();
  bool _fullNameValidator = true;

  // Email
  final TextEditingController _emailController = TextEditingController();
  bool _emailValidator = true;

  // Password
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordValidator = true;

  // Confirm Password
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _confirmPasswordValidator = true;

  // Form
  final _formKey = GlobalKey<FormState>();

  bool _isAgreeChecked = false;

  // Verification code dialog
   TextEditingController pinController = TextEditingController();
  bool _isValidPin = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
      topSafeArea: true,
      child: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(left: 21.w, right: 16.w, top: 30.h, bottom: 20.h),
          margin: EdgeInsets.only(
              left: 30.w, right: 30.w, top: kToolbarHeight, bottom: 10.h),
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
                // Register Title
                Text(
                  S.of(context).register_for_new_user,
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

                // Full Name Text Field
                _buildFullNameTextField(),

                // Space
                SizedBox(
                  height: 12.h,
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
                  height: 12.h,
                ),

                // Password Text Field
                _buildConfirmPasswordTextField(),

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

                // Register Button
                Center(
                  child: ButtonWidget(
                    text: S.of(context).register,
                    verticalPadding: 10.h,
                    horizontalPadding: 30.w,
                    shadowColor: AppColors.primaryColor.withOpacity(0.3),
                    elevation: 20,
                    onPressed: () {
                      if(_formKey.currentState!.validate() && _isAgreeChecked){

                      }
                      // pinController = TextEditingController();
                      // HelperUi.showCustomDialog(
                      //   context,
                      //   GeneralDialogWidget(
                      //     contentPadding: EdgeInsets.only(
                      //       top: 30.h,
                      //       bottom: 21.h,
                      //       left: 21.w,
                      //       right: 21.w
                      //     ),
                      //     title: S.of(context).verify_code,
                      //     subtitle: S.of(context).we_sent_an_otp,
                      //     content: _buildPinCodeTextField(),
                      //     primaryButtonName:
                      //         S.of(context).validate,
                      //     icon: SvgPicture.asset(
                      //       Helper.getSvgPath("verification_code_icon.svg"),
                      //       width: 80.h,
                      //       height: 80.h,
                      //     ),
                      //     callback: () {},
                      //
                      //   ),
                      // );
                    },
                  ),
                ),

                // Space
                SizedBox(
                  height: 30.h,
                ),

                // already Have An Account And Login
                _buildAlreadyHaveAnAccountAndLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Email Text Filed Widget
  Widget _buildFullNameTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email title
        Text(
          "${S.of(context).full_name} *",
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
          controller: _fullNameController,
          hintText: emailHint,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [RequiredValidator()],
              _fullNameValidator,
            );
          },
        ),
      ],
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
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
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

  // Email Password Widget
  Widget _buildConfirmPasswordTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email title
        Text(
          "${S.of(context).confirm_password} *",
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
          controller: _confirmPasswordController,
          hintText: passwordHint,
          isPassword: true,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [
                RequiredValidator(),
                MatchValidator(value: _passwordController.text.trim())
              ],
              _confirmPasswordValidator,
            );
          },
        ),
      ],
    );
  }

  // Remember Me and Forget Password
  Widget _buildRememberMeAndForgetPassword() {
    return Wrap(
      spacing: 10,
      runSpacing: 5,
      children: [
        // Remember Me
        Flexible(
          child: Row(
            children: [
              // Remember Me
              CustomCheckboxWidget(
                isChecked: _isAgreeChecked,
                onChanged: (value) {
                  setState(() {
                    _isAgreeChecked = value;
                  });
                },
              ),

              // Space
              SizedBox(
                width: 14.w,
              ),

              Flexible(
                child: Text(
                  S.of(context).i_agree_terms_and_conditions,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grayColor,
                      ),
                ),
              )
            ],
          ),
        ),

        // Forget Password
        Text(
          S.of(context).forget_password,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
        )
      ],
    );
  }

  // already Have An Account And Login
  Widget _buildAlreadyHaveAnAccountAndLogin() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          // Don't Have An Account Title
          TextSpan(
            text: S.of(context).already_have_an_account,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),

          // Create Account Title
          TextSpan(
            text: S.of(context).login,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, "/login_page");
              },
          ),
        ]),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return Column(
      children: [
        PinCodeTextField(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          appContext: context,
          length: 6,
          obscureText: false,
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.grayColor,
            fontWeight: FontWeight.w500,
          ),
          //AppStyle.regular(size: 14).copyWith(
          //                           color: AppColors.white,
          //                         )
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          animationType: AnimationType.fade,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [
                RequiredValidator(),
              ],
              true,
            );
          },

          backgroundColor: AppColors.transparent,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(5),
            activeFillColor: AppColors.transparent,
            inactiveColor: AppColors.borderColor,
            inactiveFillColor: AppColors.transparent,
            selectedFillColor: AppColors.transparent,
            selectedColor: AppColors.borderColor,
            activeColor: AppColors.borderColor,
            borderWidth: 1,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,

          controller: pinController,
          onCompleted: (v) {
            if (kDebugMode) {
              print("Completed");
            }
          },
          onChanged: (value) {
            setState(() {
              if (value.isNotEmpty && value.length == 6) {
                _isValidPin = true;
              }else{
                _isValidPin = false;
              }
            });
          },
          beforeTextPaste: (text) {
            if (kDebugMode) {
              print("Allowing to paste $text");
            }
            return true;
          },
        ),

        SizedBox(
         height: 10.h,
        )
      ],
    );
  }
}
