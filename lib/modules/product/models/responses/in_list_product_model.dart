import '../../../../core/utils/json_utils.dart';

class InListProductModel {
  final int prodId;
  final String title;
  final String imgUrl;
  final num campaignPercentage;
  final num price;
  final num discountPrice;
  Badge? badge;
  dynamic taxOSR;
  final bool campaignProduct;
  final int stockCount;
  final num avgRatting;
  final bool isCartAble;
  final int vendorId;
  final String vendorName;
  final int categoryId;
  final int subCategoryId;
  final List<int> childCategoryIds;

  InListProductModel({
    required this.prodId,
    required this.title,
    required this.imgUrl,
    required this.campaignPercentage,
    required this.price,
    required this.discountPrice,
    required this.badge,
    required this.campaignProduct,
    required this.stockCount,
    required this.avgRatting,
    required this.isCartAble,
    required this.vendorId,
    required this.vendorName,
    required this.categoryId,
    required this.subCategoryId,
    required this.childCategoryIds,
    required this.taxOSR,
  });

  factory InListProductModel.fromJson(Map<String, dynamic> json) => InListProductModel(
        prodId: JsonUtils.parseIntFromJson(json["prd_id"]),
        title: JsonUtils.parseStringFromJson(json["title"]),
        imgUrl: JsonUtils.parseStringFromJson(json["img_url"]),
        taxOSR: JsonUtils.parseIntFromJson(json["tax_options_sum_rate"]),
        campaignPercentage: JsonUtils.parseIntFromJson(json["campaign_percentage"]).toDouble(),
        price: JsonUtils.parseIntFromJson(json["price"]),
        discountPrice: JsonUtils.parseIntFromJson(json["discount_price"]),
        badge: Badge.fromJson(json["badge"] ?? {}),
        campaignProduct: json["campaign_product"],
        stockCount: JsonUtils.parseIntFromJson(json["stock_count"]),
        avgRatting: JsonUtils.parseNumFromJson(json["avg_ratting"]),
        isCartAble: json["is_cart_able"],
        vendorId: JsonUtils.parseIntFromJson(json["vendor_id"]),
        vendorName: JsonUtils.parseStringFromJson(json["vendor_name"]),
        categoryId: JsonUtils.parseIntFromJson(json["category_id"]),
        subCategoryId: JsonUtils.parseIntFromJson(json["sub_category_id"]),
        childCategoryIds: List<int>.from(json["child_category_ids"].map((id) => id)),
      );
}

class Badge {
  final String badgeName;
  final String image;

  Badge({
    required this.badgeName,
    required this.image,
  });

  factory Badge.fromJson(Map<String, dynamic> json) => Badge(
        badgeName: JsonUtils.parseStringFromJson(json["badge_name"]),
        image: JsonUtils.parseStringFromJson(json["image"]),
      );
}
