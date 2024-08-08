import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

class EditAccountBody {
  String? fullName;
  String? email;
  String? mobile;
  int? countryId;
  int? stateId;
  int? cityId;
  String? zipCode;
  dynamic image;

  EditAccountBody({
    this.fullName,
    this.email,
    this.mobile,
    this.countryId,
    this.stateId,
    this.cityId,
    this.zipCode,
    this.image,
  });

  void copyWith({
    String? fullName,
    String? email,
    String? mobile,
    int? countryId,
    int? stateId,
    int? cityId,
    String? zipCode,
    File? image,
  }) {
    this.fullName = fullName ?? this.fullName;
    this.email = email ?? this.email;
    this.mobile = mobile ?? this.mobile;
    this.countryId = countryId ?? this.countryId;
    this.stateId = stateId ?? this.stateId;
    this.cityId = cityId ?? this.cityId;
    this.zipCode = zipCode ?? this.zipCode;
    this.image = image ?? this.image;
  }

  FormData toFormData() {
    final FormData formData = FormData.fromMap({
      if (fullName != null) 'full_name': fullName,
      if (email != null) 'email': email,
      if (mobile != null) 'mobile': mobile,
      if (countryId != null) 'country_id': countryId,
      if (stateId != null) 'state_id': stateId,
      if (cityId != null) 'city_id': cityId,
      if (zipCode != null) 'postal_code': zipCode,
      "user_type": "api",
      if (image != null && image is File)
        'file': MultipartFile.fromFileSync(
          image!.path,
          filename: 'profileImage$fullName$zipCode${image!.path}.jpg',
          contentType: MediaType("image", "jpg"),
        ),
    });
    return formData;
  }
}
