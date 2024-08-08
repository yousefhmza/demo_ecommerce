// To parse this JSON data, do
//
//     final shippingCostModel = shippingCostModelFromJson(jsonString);

import 'package:ecommerce/core/utils/json_utils.dart';

class ShippingCostModel {
  final num tax;
  final List<DefaultShippingOptions> shippingOptions;
  final DefaultShippingOptions defaultShippingOptions;
  final num productTaxes;

  ShippingCostModel({
    required this.tax,
    required this.shippingOptions,
    required this.defaultShippingOptions,
    required this.productTaxes,
  });

  factory ShippingCostModel.fromJson(Map<dynamic, dynamic> json) => ShippingCostModel(
        tax: JsonUtils.parseNumFromJson(json["tax"]),
        shippingOptions: json["shipping_options"] == null
            ? []
            : List<DefaultShippingOptions>.from(
                json["shipping_options"].map((x) => DefaultShippingOptions.fromJson(x)),
              ),
        defaultShippingOptions: DefaultShippingOptions.fromJson(json["default_shipping_options"] ?? {}),
        productTaxes: JsonUtils.parseNumFromJson(json["product_tax_info"]),
      );
}

class DefaultShippingOptions {
  final int id;
  final String name;
  final int zoneId;
  final int isDefault;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Options options;

  DefaultShippingOptions({
    required this.id,
    required this.name,
    required this.zoneId,
    required this.isDefault,
    required this.createdAt,
    required this.updatedAt,
    required this.options,
  });

  factory DefaultShippingOptions.fromJson(Map<dynamic, dynamic> json) => DefaultShippingOptions(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        zoneId: JsonUtils.parseIntFromJson(json["zone_id"]),
        isDefault: JsonUtils.parseIntFromJson(json["is_default"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        options: Options.fromJson(json["options"] ?? {}),
      );
}

class Options {
  final int id;
  final String title;
  final int shippingMethodId;
  final int status;
  final int taxStatus;
  final dynamic settingPreset;
  final num cost;
  final int minimumOrderAmount;
  final String coupon;
  final DateTime createdAt;
  final DateTime updatedAt;

  Options({
    required this.id,
    required this.title,
    required this.shippingMethodId,
    required this.status,
    required this.taxStatus,
    this.settingPreset,
    required this.cost,
    required this.minimumOrderAmount,
    required this.coupon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Options.fromJson(Map<dynamic, dynamic> json) => Options(
        id: JsonUtils.parseIntFromJson(json["id"]),
        title: JsonUtils.parseStringFromJson(json["title"]),
        shippingMethodId: JsonUtils.parseIntFromJson(json["shipping_method_id"]),
        status: JsonUtils.parseIntFromJson(json["status"]),
        taxStatus: JsonUtils.parseIntFromJson(json["tax_status"]),
        settingPreset: json["setting_preset"],
        cost: JsonUtils.parseIntFromJson(json["cost"]),
        minimumOrderAmount: JsonUtils.parseIntFromJson(json["minimum_order_amount"]),
        coupon: JsonUtils.parseStringFromJson(json["coupon"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
      );
}
