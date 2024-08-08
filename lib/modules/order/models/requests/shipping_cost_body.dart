import 'dart:convert';

class ShippingCostBody {
  int? countryId;
  int? stateId;
  int? cityId;
  List<int>? productIds;

  ShippingCostBody({
    this.countryId,
    this.stateId,
    this.cityId,
    this.productIds,
  });

  void copyWith({
    int? countryId,
    int? stateId,
    int? cityId,
    List<int>? productIds,
  }) {
    this.countryId = countryId ?? this.countryId;
    this.stateId = stateId ?? this.stateId;
    this.cityId = cityId ?? this.cityId;
    this.productIds = productIds ?? this.productIds;
  }

  Map<String, dynamic> toJson() {
    return {
      if (countryId != null) 'country': countryId,
      if (stateId != null) 'state': stateId,
      if (cityId != null) 'city': cityId,
      if (productIds != null) "product_ids": jsonEncode(productIds),
    };
  }
}
