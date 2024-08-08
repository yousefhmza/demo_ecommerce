import '../../../../core/utils/json_utils.dart';
import 'in_list_product_model.dart';
import 'product_color_or_size_model.dart';
import 'product_review_model.dart';

import 'additional_info_store_model.dart';
import 'product_model.dart';
import 'return_policy_model.dart';

class ProductDetailsModel {
  final Product product;
  final String productUrl;
  final List<InListProductModel> relatedProducts;
  final dynamic userHasItem;
  final List<ProductReview> ratings;
  final int avgRating;
  final dynamic availableAttributes;
  final List<Map<String, dynamic>> productInventorySet;
  final Map<String, AdditionalInfoStore>? additionalInfoStore;
  final num maximumAvailablePrice;
  final List<ProductColorOrSize> productColors;
  final List<ProductColorOrSize> productSizes;
  final List<dynamic> settingText;
  final bool userRatedAlready;
  final ReturnPolicy returnPolicy;

  ProductDetailsModel({
    required this.product,
    required this.productUrl,
    required this.relatedProducts,
    required this.userHasItem,
    required this.ratings,
    required this.avgRating,
    required this.availableAttributes,
    required this.productInventorySet,
    required this.additionalInfoStore,
    required this.maximumAvailablePrice,
    required this.productColors,
    required this.productSizes,
    required this.settingText,
    required this.userRatedAlready,
    required this.returnPolicy,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
        product: Product.fromJson(json["product"] ?? {}),
        productUrl: JsonUtils.parseStringFromJson(json["product_url"]),
        relatedProducts: json["related_products"] == null
            ? []
            : List<InListProductModel>.from(
                json["related_products"].map((product) => InListProductModel.fromJson(product))),
        userHasItem: json["user_has_item"],
        ratings: List<ProductReview>.from(json["ratings"].map((rating) => ProductReview.fromJson(rating))),
        avgRating: JsonUtils.parseIntFromJson(json["avg_rating"]),
        availableAttributes: json["available_attributes"],
        productInventorySet:
            json["product_inventory_set"] == null ? [] : List<Map<String, dynamic>>.from(json["product_inventory_set"]),
        additionalInfoStore: json["additional_info_store"] is List
            ? null
            : Map.from(json["additional_info_store"])
                .map((k, v) => MapEntry<String, AdditionalInfoStore>(k, AdditionalInfoStore.fromJson(v))),
        maximumAvailablePrice: JsonUtils.parseNumFromJson(json["maximum_available_price"]),
        productColors:
            List<ProductColorOrSize>.from(json["productColors"].map((color) => ProductColorOrSize.fromJson(color))),
        productSizes:
            List<ProductColorOrSize>.from(json["productSizes"].map((size) => ProductColorOrSize.fromJson(size))),
        settingText: List<dynamic>.from(json["setting_text"].map((x) => x)),
        userRatedAlready: json["user_rated_already"],
        returnPolicy: ReturnPolicy.fromJson(json["return_policy"] ?? {}),
      );
}
