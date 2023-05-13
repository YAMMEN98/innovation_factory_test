enum AppEnum {
  mobile,
  desktop,
  web,
}

extension AppEnumExtension on AppEnum {
  String get name {
    switch (this) {
      case AppEnum.mobile:
        return "mobile";
      case AppEnum.desktop:
        return "desktop";
      case AppEnum.web:
        return "web";
      default:
        return "mobile";
    }
  }
}
