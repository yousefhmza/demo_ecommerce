import '../../../../core/utils/json_utils.dart';

class AdditionalInfoStore {
  final int pidId;
  final num additionalPrice;
  final int stockCount;
  final String image;

  AdditionalInfoStore({
    required this.pidId,
    required this.additionalPrice,
    required this.stockCount,
    required this.image,
  });

  factory AdditionalInfoStore.fromJson(Map<String, dynamic> json) => AdditionalInfoStore(
        pidId: JsonUtils.parseIntFromJson(json["pid_id"]),
        additionalPrice: JsonUtils.parseNumFromJson(json["additional_price"]),
        stockCount: JsonUtils.parseIntFromJson(json["stock_count"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
      );
}
