import '../../../../core/base/models/image_model.dart';
import '../../../../core/utils/json_utils.dart';
import 'product_color_or_size_model.dart';

class InventoryDetails {
  final int id;
  final int productInventoryId;
  final int productId;
  final String color;
  final String size;
  final String hash;
  final num additionalPrice;
  final num addCost;
  final int image;
  final int stockCount;
  final int soldCount;
  final List<Attribute> attribute;
  final ImageModel attrImage;
  final ProductColorOrSize productColor;
  final ProductColorOrSize productSize;

  InventoryDetails({
    required this.id,
    required this.productInventoryId,
    required this.productId,
    required this.color,
    required this.size,
    required this.hash,
    required this.additionalPrice,
    required this.addCost,
    required this.image,
    required this.stockCount,
    required this.soldCount,
    required this.attribute,
    required this.attrImage,
    required this.productColor,
    required this.productSize,
  });

  factory InventoryDetails.fromJson(Map<String, dynamic> json) => InventoryDetails(
        id: JsonUtils.parseIntFromJson(json["id"]),
        productInventoryId: JsonUtils.parseIntFromJson(json["product_inventory_id"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
        color: JsonUtils.parseStringFromJson(json["color"]),
        size: JsonUtils.parseStringFromJson(json["size"]),
        hash: JsonUtils.parseStringFromJson(json["hash"]),
        additionalPrice: JsonUtils.parseNumFromJson(json["additional_price"]),
        addCost: JsonUtils.parseNumFromJson(json["add_cost"]),
        image: JsonUtils.parseIntFromJson(json["image"]),
        stockCount: JsonUtils.parseIntFromJson(json["stock_count"]),
        soldCount: JsonUtils.parseIntFromJson(json["sold_count"]),
        attribute: List<Attribute>.from(json["attribute"].map((x) => Attribute.fromJson(x))),
        attrImage: ImageModel.fromJson(json["attr_image"] ?? {}),
        productColor: ProductColorOrSize.fromJson(json["product_color"] ?? {}),
        productSize: ProductColorOrSize.fromJson(json["product_size"] ?? {}),
      );
}

class Attribute {
  final int id;
  final int productId;
  final int inventoryDetailsId;
  final String attributeName;
  final String attributeValue;

  Attribute({
    required this.id,
    required this.productId,
    required this.inventoryDetailsId,
    required this.attributeName,
    required this.attributeValue,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        id: JsonUtils.parseIntFromJson(json["id"]),
        productId: JsonUtils.parseIntFromJson(json["product_id"]),
        inventoryDetailsId: JsonUtils.parseIntFromJson(json["inventory_details_id"]),
        attributeName: JsonUtils.parseStringFromJson(json["attribute_name"]),
        attributeValue: JsonUtils.parseStringFromJson(json["attribute_value"]),
      );
}
