enum EnumGender { male, female, undefined }

extension EnumGenderExtension on EnumGender {
  bool get isMale => this == EnumGender.male;
  bool get isFemale => this == EnumGender.female;
  bool get isUndefined => this == EnumGender.undefined;

  static EnumGender fromString(String gender) {
    gender = gender.toLowerCase();
    switch (gender) {
      case 'male':
        return EnumGender.male;
      case 'female':
        return EnumGender.female;
      default:
        return EnumGender.undefined;
    }
  }
}
