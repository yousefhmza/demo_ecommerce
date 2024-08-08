import '../../../../core/utils/json_utils.dart';
import 'product_inventory_model.dart';

import '../../../categories/models/responses/category_model.dart';
import '../../../product/models/responses/product_color_or_size_model.dart';
import '../../../categories/models/responses/child_category_model.dart';
import 'delivery_option_model.dart';
import 'inventory_details_model.dart';
import 'product_review_model.dart';
import 'product_tag_model.dart';

class Product {
  final int id;
  final String name;
  final String slug;
  final String summary;
  final String description;
  final num price;
  final num salePrice;
  final dynamic taxOSR;
  final num cost;
  final dynamic badgeId;
  final dynamic brandId;
  final dynamic statusId;
  final dynamic productType;
  final dynamic soldCount;
  final int minPurchase;
  final int maxPurchase;
  final int isRefundable;
  final int isInHouse;
  final int isInventoryWarnAble;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;
  final int inventoryDetailCount;
  final String reviewsAvgRating;
  final int reviewsCount;
  final String image;
  final CategoryModel category;
  final CategoryModel subCategory;
  final List<ChildCategory> childCategory;
  final List<Tag> tag;
  final List<ProductColorOrSize> color;
  final List<ProductColorOrSize> sizes;
  final dynamic campaignProduct;
  final List<InventoryDetails> inventoryDetail;
  final List<ProductReview> reviews;
  final ProductInventory inventory;
  final List<String> galleryImages;
  final List<DeliveryOption> deliveryOption;

  Product({
    required this.id,
    required this.name,
    required this.slug,
    required this.summary,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.cost,
    required this.badgeId,
    required this.brandId,
    required this.statusId,
    required this.productType,
    required this.soldCount,
    required this.minPurchase,
    required this.maxPurchase,
    required this.isRefundable,
    required this.isInHouse,
    required this.isInventoryWarnAble,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.inventoryDetailCount,
    required this.reviewsAvgRating,
    required this.reviewsCount,
    required this.image,
    required this.category,
    required this.subCategory,
    required this.childCategory,
    required this.tag,
    required this.color,
    required this.sizes,
    required this.campaignProduct,
    required this.inventoryDetail,
    required this.reviews,
    required this.inventory,
    required this.galleryImages,
    required this.deliveryOption,
    required this.taxOSR,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        slug: json["slug"] ?? "",
        taxOSR: json["tax_options_sum_rate"] ?? "",
        summary: json["summary"] ?? "",
        description: json["description"] ?? "",
        price: JsonUtils.parseNumFromJson(json["price"]),
        salePrice: JsonUtils.parseNumFromJson(json["sale_price"]),
        cost: JsonUtils.parseNumFromJson(json["cost"]),
        badgeId: json["badge_id"],
        brandId: json["brand_id"],
        statusId: json["status_id"],
        productType: json["product_type"],
        soldCount: json["sold_count"],
        minPurchase: JsonUtils.parseIntFromJson(json["min_purchase"]),
        maxPurchase: JsonUtils.parseIntFromJson(json["max_purchase"]),
        isRefundable: JsonUtils.parseIntFromJson(json["is_refundable"]),
        isInHouse: JsonUtils.parseIntFromJson(json["is_in_house"]),
        isInventoryWarnAble: JsonUtils.parseIntFromJson(json["is_inventory_warn_able"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        deletedAt: JsonUtils.parseDatetimeFromJson(json["deleted_at"]),
        inventoryDetailCount: JsonUtils.parseIntFromJson(json["inventory_detail_count"]),
        reviewsAvgRating: json["reviews_avg_rating"] ?? "",
        reviewsCount: JsonUtils.parseIntFromJson(json["reviews_count"]),
        image: json["image"] ?? "",
        category: CategoryModel.fromJson(json["category"] ?? {}),
        subCategory: CategoryModel.fromJson(json["sub_category"] ?? {}),
        childCategory: json["child_category"] == null
            ? []
            : List<ChildCategory>.from(json["child_category"].map((cat) => ChildCategory.fromJson(cat))),
        tag: json["tag"] == null ? [] : List<Tag>.from(json["tag"].map((x) => Tag.fromJson(x))),
        color: json["color"] == null
            ? []
            : List<ProductColorOrSize>.from(json["color"].map((color) => ProductColorOrSize.fromJson(color))),
        sizes: json["sizes"] == null
            ? []
            : List<ProductColorOrSize>.from(json["sizes"].map((size) => ProductColorOrSize.fromJson(size))),
        campaignProduct: json["campaign_product"],
        inventoryDetail: json["inventory_detail"] == null
            ? []
            : List<InventoryDetails>.from(json["inventory_detail"].map((detail) => InventoryDetails.fromJson(detail))),
        reviews: json["reviews"] == null
            ? []
            : List<ProductReview>.from(json["reviews"].map((review) => ProductReview.fromJson(review))),
        inventory: ProductInventory.fromJson(json["inventory"] ?? {}),
        galleryImages: json["gallery_images"] == null
            ? []
            : List<String>.from(json["gallery_images"].map((gImage) => gImage["image"])),
        deliveryOption: json["delivery_option"] == null
            ? []
            : List<DeliveryOption>.from(json["delivery_option"].map((option) => DeliveryOption.fromJson(option))),
      );
}
