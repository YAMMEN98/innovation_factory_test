import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/pages/background_page.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_loader.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/app_snack_bar.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/button_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/checkbox_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/constant/app_constants.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';
import 'package:innovation_factory_test/src/core/util/router.dart';
import 'package:innovation_factory_test/src/core/util/validators/base_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/email_validator1.dart';
import 'package:innovation_factory_test/src/core/util/validators/match_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/password_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/phone_number_validator.dart';
import 'package:innovation_factory_test/src/core/util/validators/required_validator.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:innovation_factory_test/src/features/auth/presentation/widgets/verification_code_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthBloc _bloc = AuthBloc();

  // Full Name
  final TextEditingController _fullNameController = TextEditingController();
  bool _fullNameValidator = true;

  // Email
  final TextEditingController _emailController = TextEditingController();
  bool _emailValidator = true;

  // Email
  final TextEditingController _phoneController = TextEditingController();
  bool _phoneValidator = true;

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

                // Phone Text Field
                _buildPhoneTextField(),

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
                  child: BlocConsumer<AuthBloc, AuthState>(
                    bloc: _bloc,
                    listener: (context, state) {
                      if (state is ErrorRegisterState) {
                        HelperUi.showSnackBar(context, state.errorMsg,
                            type: ToastTypeEnum.error);
                      } else if (state is SuccessRegisterState) {
                        showVerificationCodeDialog(state.userId);
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingRegisterState) {
                        return const AppLoader();
                      }

                      return ButtonWidget(
                        text: S.of(context).register,
                        verticalPadding: 15.sp,
                        horizontalPadding: 30.w,
                        shadowColor: AppColors.shadowColor,
                        elevation: 20,
                        onPressed: () {
                          if (_formKey.currentState!.validate() &&
                              _isAgreeChecked) {
                            register();
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

                // Already Have An Account And Login
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

  // Phone Text Filed Widget
  Widget _buildPhoneTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Email title
        Text(
          "${S.of(context).phone} *",
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
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          validator: (value) {
            return BaseValidator.validateValue(
              context,
              value!,
              [RequiredValidator(), PhoneNumberValidator()],
              _phoneValidator,
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
        Row(
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
              width: 14,
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

  // Already Have An Account And Login
  Widget _buildAlreadyHaveAnAccountAndLogin() {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          // Already Have An Account
          TextSpan(
            text: S.of(context).already_have_an_account,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),

          // Login
          TextSpan(
            text: S.of(context).login,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacementNamed(context, AppPageRouteName.login.name);
              },
          ),
        ]),
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
        isRememberMe: true,
      ),
    );
  }

  // Register
  void register() {
    // Close Keyboard
    FocusScope.of(context).unfocus();

    String fullName = _fullNameController.text.trim();
    String firstName = fullName.split(" ").first;
    String lastName = fullName.split(" ").sublist(1).join(" ");
    String email = _emailController.text.trim();
    String phone = _phoneController.text.trim();
    String password = _passwordController.text.trim();

    _bloc.add(
      OnRegisteringEvent(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        referUser: "",
      ),
    );
  }
}
