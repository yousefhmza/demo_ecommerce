import '../../../../core/utils/json_utils.dart';

class ProductInventory {
  final int id;
  final int productId;
  final String sku;
  final int stockCount;
  final int soldCount;

  ProductInventory({
    required this.id,
    required this.productId,
    required this.sku,
    required this.stockCount,
    required this.soldCount,
  });

  factory ProductInventory.fromJson(Map<String, dynamic> json) => ProductInventory(
        id: JsonUtils.parseIntFromJson(json["id"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
        sku: JsonUtils.parseStringFromJson(json["sku"]),
        stockCount: JsonUtils.parseIntFromJson(json["stock_count"]),
        soldCount: JsonUtils.parseIntFromJson(json["sold_count"]),
      );
}
