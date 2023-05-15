enum GenderEnum {
  male,
  female,
}

extension GenderEnumExtension on GenderEnum {
  String get name {
    switch (this) {
      case GenderEnum.male:
        return "Male";
      case GenderEnum.female:
        return "Female";
      default:
        return "Male";
    }
  }
}
