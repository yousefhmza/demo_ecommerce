class AddressBody {
  String? fullName;
  String? email;
  String? phone;
  int? countryId;
  int? stateId;
  int? cityId;
  String? postalCode;
  String? address;
  String? shippingAddressName;
  int? userId;

  AddressBody({
    this.fullName,
    this.email,
    this.phone,
    this.countryId,
    this.stateId,
    this.cityId,
    this.postalCode,
    this.address,
    this.shippingAddressName,
    this.userId,
  });

  void copyWith({
    String? address,
    String? shippingAddressName,
  }) {
    this.address = address ?? this.address;
    this.shippingAddressName = shippingAddressName ?? this.shippingAddressName;
  }

  Map<String, dynamic> toJson() {
    return {
      if (shippingAddressName != null) "full_name": shippingAddressName,
      if (email != null) "email": email,
      if (phone != null) "phone": phone,
      if (stateId != null) "state_id": stateId,
      if (cityId != null) "city_id": cityId,
      if (postalCode != null) "postal_code": postalCode,
      if (countryId != null) "country_id": countryId,
      if (address != null) "address": address,
      if (shippingAddressName != null) "shipping_address_name": shippingAddressName,
      if (userId != null) "user_id": userId
    };
  }
}
