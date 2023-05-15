import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innovation_factory_test/src/core/common_feature/domain/entities/gender_enum.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/country_picker_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/mobile_widget.dart';
import 'package:innovation_factory_test/src/core/common_feature/presentation/widgets/text_field_widget.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper.dart';
import 'package:innovation_factory_test/src/core/util/helper/helper_ui.dart';

class PassengerCardWidget extends StatefulWidget {
  final int index;
  final bool isAdult;
  final bool isLead;

  const PassengerCardWidget(
      {Key? key,
      required this.isAdult,
      required this.isLead,
      required this.index})
      : super(key: key);

  @override
  State<PassengerCardWidget> createState() => _PassengerCardWidgetState();
}

class _PassengerCardWidgetState extends State<PassengerCardWidget> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _birthOfDateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passportNumberController = TextEditingController();
  final TextEditingController _passportBirthOfDateController = TextEditingController();

  // Nationality
  CountryCode _countryCode = CountryCode();


  // Mobile Country Code
  String _mobileCountryCode = "+971";

  @override
  void initState() {
    _genderController.text = GenderEnum.male.name;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 25.sp,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            spreadRadius: 3,
            blurRadius: 15,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Traveler Type
          Text(
            _buildPassengerType(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),

          // Space
          SizedBox(
            height: 10.sp,
          ),

          Divider(
            color: AppColors.lightGrayColor,
          ),

          // Space
          SizedBox(
            height: 10.sp,
          ),

          // Full Name And Last Name
          Row(
            children: [
              // First Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${S.of(context).first_name} *",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    TextFieldWidget(
                      controller: _firstNameController,
                      hintText: "Julia",
                      isUnderLineBorder: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 10.sp,
              ),

              // Last Name
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${S.of(context).last_name} *",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    TextFieldWidget(
                      controller: _lastNameController,
                      hintText: "Robinson",
                      isUnderLineBorder: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Space
          SizedBox(
            height: 20.sp,
          ),

          // Gender And Date Of Birth
          Row(
            children: [
              // Gender
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).gender,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) {
                        return [
                          // Male
                          PopupMenuItem<GenderEnum>(
                            value: GenderEnum.male,
                            child: Text(
                              GenderEnum.male.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),

                          // Female
                          PopupMenuItem<GenderEnum>(
                            value: GenderEnum.female,
                            child: Text(
                              GenderEnum.female.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ];
                      },
                      child: TextFieldWidget(
                        controller: _genderController,
                        enabled: false,
                        hintText: S.of(context).male,
                        isUnderLineBorder: true,
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          size: 20.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 5.sp,
              ),

              // Date Of Birth
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).birth_of_date,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HelperUi.showDatePicker(
                          context: context,
                          callback: (dateTime) {
                            _birthOfDateController.text =
                                HelperUi.formatToStandardDate(dateTime);
                          },
                        );
                      },
                      child: TextFieldWidget(
                        controller: _birthOfDateController,
                        enabled: false,
                        hintText: "YYYY/MM/DD",
                        isUnderLineBorder: true,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: SvgPicture.asset(
                            Helper.getSvgPath("calendar.svg"),
                            width: 13.sp,
                            height: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Space
          SizedBox(
            height: 20.sp,
          ),

          // Nationality
          CountryPickerWidget(
            callback: (countryCode) {
              if(countryCode != null){
                _countryCode = countryCode;
              }
            },
          ),

          // Space
          SizedBox(
            height: 20.sp,
          ),

          // Mobile
          MobileWidget(
            callback: (countryCode, mobile) {
              if(countryCode != null){
                _mobileCountryCode = countryCode;
              }
            },
          ),

          // Space
          SizedBox(
            height: 20.sp,
          ),

          // Email
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "${S.of(context).email} *",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextFieldWidget(
                controller: _emailController,
                enabled: false,
                hintText: S.of(context).enter_your_email_address,
                isUnderLineBorder: true,
                contentPadding: EdgeInsets.zero,
              ),
            ],
          ),

          SizedBox(
            height: 5.sp,
          ),

          // Booking Confirmation title
          Text(
            S.of(context).booking_confirmation_will_be_sent,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.lightGrayColor,
            ),
          ),

          SizedBox(
            height: 15.sp,
          ),

          Text(
            S.of(context).passport_details,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(
            height: 10.sp,
          ),

          Text(
            S.of(context).please_enter_details_exactly,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(
            height: 10.sp,
          ),

          // Passport Number And Date Of Birth
          Row(
            children: [
              // Passport Number
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${S.of(context).passport_number} *",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextFieldWidget(
                      controller: _passportNumberController,
                      enabled: false,
                      hintText: S.of(context).your_passport_number,
                      isUnderLineBorder: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: 5.sp,
              ),

              // Date Of Birth
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      S.of(context).birth_of_date,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HelperUi.showDatePicker(
                          context: context,
                          callback: (dateTime) {
                            _passportBirthOfDateController.text =
                                HelperUi.formatToStandardDate(dateTime);
                          },
                        );
                      },
                      child: TextFieldWidget(
                        controller: _passportBirthOfDateController,
                        enabled: false,
                        hintText: "YYYY/MM/DD",
                        isUnderLineBorder: true,
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.sp),
                          child: SvgPicture.asset(
                            Helper.getSvgPath("calendar.svg"),
                            width: 13.sp,
                            height: 13.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }

  // Build Passenger Type
  _buildPassengerType() {
    String passengerType = "${S.of(context).traveler} ${widget.index}: ";

    if (widget.isAdult) {
      passengerType += S.of(context).adult;
    } else {
      passengerType += S.of(context).child;
    }

    if (widget.isLead) {
      passengerType += " (${S.of(context).adult})";
    }

    return passengerType;
  }
}
