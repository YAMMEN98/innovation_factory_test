import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:innovation_factory_test/src/core/styles/app_colors.dart';
import 'package:innovation_factory_test/src/core/translations/l10n.dart';

class CountryCodePickerWidget extends StatefulWidget {
  final Function(CountryCode? countryCode) onInit;
  final Function(CountryCode? countryCode) onChanged;
  final bool showOnlyCountryOnDialog;
  final bool showOnlyCountryWhenClosed;

  const CountryCodePickerWidget({
    Key? key,
    required this.onInit,
    required this.onChanged,
    this.showOnlyCountryOnDialog = false,
    this.showOnlyCountryWhenClosed = false,
  }) : super(key: key);

  @override
  State<CountryCodePickerWidget> createState() =>
      _CountryCodePickerWidgetState();
}

class _CountryCodePickerWidgetState extends State<CountryCodePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      initialSelection: "AE",
      onInit: widget.onInit,
      onChanged: widget.onChanged,
      showCountryOnly: widget.showOnlyCountryOnDialog,
      showOnlyCountryWhenClosed: widget.showOnlyCountryWhenClosed,
      alignLeft: true,
      padding: EdgeInsets.zero,
      searchDecoration: InputDecoration(
        hintText: S.of(context).search,
        hintStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
      flagDecoration: BoxDecoration(shape: BoxShape.circle),
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.grayColor,
          ),
    );
  }
}
