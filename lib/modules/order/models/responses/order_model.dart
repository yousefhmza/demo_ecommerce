import '../../../../core/utils/json_utils.dart';
import '../../../regions/models/region_model.dart';

class OrderModel {
  final int id;
  final String name;
  final String email;
  final int userId;
  final String phone;
  final int countryId;
  final String address;
  final int cityId;
  final int stateId;
  final String zipcode;
  final String message;
  final String coupon;
  final dynamic couponDiscounted;
  final num totalAmount;
  final String status;
  final String paymentStatus;
  final String paymentGateway;
  final String paymentTrack;
  final int transactionId;
  final String paymentMeta;
  final int shippingAddressId;
  final dynamic selectedShippingOption;
  final dynamic checkoutType;
  final dynamic checkoutImagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Region country;
  final Region state;
  final Region city;

  OrderModel({
    required this.id,
    required this.name,
    required this.email,
    required this.userId,
    required this.phone,
    required this.countryId,
    required this.address,
    required this.cityId,
    required this.stateId,
    required this.zipcode,
    required this.message,
    required this.coupon,
    required this.couponDiscounted,
    required this.totalAmount,
    required this.status,
    required this.paymentStatus,
    required this.paymentGateway,
    required this.paymentTrack,
    required this.transactionId,
    required this.paymentMeta,
    required this.shippingAddressId,
    required this.selectedShippingOption,
    required this.checkoutType,
    required this.checkoutImagePath,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
    required this.state,
    required this.city,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        email: JsonUtils.parseStringFromJson(json["email"]),
        userId: JsonUtils.parseIntFromJson(json["user_id"]),
        phone: JsonUtils.parseStringFromJson(json["phone"]),
        countryId: JsonUtils.parseIntFromJson(json["country"]),
        address: JsonUtils.parseStringFromJson(json["address"]),
        cityId: JsonUtils.parseIntFromJson(json["city"]),
        stateId: JsonUtils.parseIntFromJson(json["state"]),
        zipcode: JsonUtils.parseStringFromJson(json["zipcode"]),
        message: JsonUtils.parseStringFromJson(json["message"]),
        coupon: JsonUtils.parseStringFromJson(json["coupon"]),
        couponDiscounted: json["coupon_discounted"],
        totalAmount: JsonUtils.parseNumFromJson(json["total_amount"]),
        status: JsonUtils.parseStringFromJson(json["status"]),
        paymentStatus: JsonUtils.parseStringFromJson(json["payment_status"]),
        paymentGateway: JsonUtils.parseStringFromJson(json["payment_gateway"]),
        paymentTrack: JsonUtils.parseStringFromJson(json["payment_track"]),
        transactionId: JsonUtils.parseIntFromJson(json["transaction_id"]),
        paymentMeta: JsonUtils.parseStringFromJson(json["payment_meta"]),
        shippingAddressId: JsonUtils.parseIntFromJson(json["shipping_address_id"]),
        selectedShippingOption: json["selected_shipping_option"],
        checkoutType: json["checkout_type"],
        checkoutImagePath: json["checkout_image_path"],
        country: Region.fromJson(json["get_country"] ?? {}),
        state: Region.fromJson(json["get_state"] ?? {}),
        city: Region.fromJson(json["get_city"] ?? {}),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
      );
}
