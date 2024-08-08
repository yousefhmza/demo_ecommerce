class RegisterBody {
  String? userName;
  String? password;
  String? fullName;
  String? email;
  String? mobile;
  String? countryId;
  String? stateId;
  String? cityId;
  String? termsConditions;
  String? zipCode;

  RegisterBody({
    this.userName,
    this.password,
    this.fullName,
    this.email,
    this.mobile,
    this.countryId,
    this.stateId,
    this.cityId,
    this.termsConditions = "on",
    this.zipCode,
  });

  void copyWith({
    String? userName,
    String? password,
    String? fullName,
    String? email,
    String? mobile,
    String? countryId,
    String? stateId,
    String? cityId,
    String? termsConditions,
    String? zipCode,
  }) {
    this.userName = userName ?? this.userName;
    this.password = password ?? this.password;
    this.fullName = fullName ?? this.fullName;
    this.email = email ?? this.email;
    this.mobile = mobile ?? this.mobile;
    this.countryId = countryId ?? this.countryId;
    this.stateId = stateId ?? this.stateId;
    this.cityId = cityId ?? this.cityId;
    this.termsConditions = termsConditions ?? this.termsConditions;
    this.zipCode = zipCode ?? this.zipCode;
  }

  Map<String, dynamic> toJson() {
    return {
      if (userName != null) 'username': userName,
      if (password != null) 'password': password,
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (mobile != null) 'mobile': mobile,
      if (countryId != null) 'country_id': countryId,
      if (stateId != null) 'state_id': stateId,
      if (cityId != null) 'city_id': cityId,
      if (termsConditions != null) 'terms_conditions': termsConditions,
      if (zipCode != null) 'postal_code': zipCode,
    };
  }
}
