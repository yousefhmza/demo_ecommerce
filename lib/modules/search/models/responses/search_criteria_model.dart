import '../../../../core/utils/json_utils.dart';
import '../../../product/models/responses/product_color_or_size_model.dart';

class SearchCriteria {
  final List<Category> allCategory;
  final List<Unit> allUnits;
  final List<ProductColorOrSize> allColors;
  final List<ProductColorOrSize> allSizes;
  final num maxPrice;
  final num minPrice;
  final List<String> itemStyle;

  SearchCriteria({
    required this.allCategory,
    required this.allUnits,
    required this.allColors,
    required this.allSizes,
    required this.maxPrice,
    required this.minPrice,
    required this.itemStyle,
  });

  factory SearchCriteria.fromJson(Map<String, dynamic> json) => SearchCriteria(
        allCategory: List<Category>.from(json["all_category"].map((category) => Category.fromJson(category))),
        allUnits: List<Unit>.from(json["all_units"].map((unit) => Unit.fromJson(unit))),
        allColors: List<ProductColorOrSize>.from(json["all_colors"].map((color) => ProductColorOrSize.fromJson(color))),
        allSizes: List<ProductColorOrSize>.from(json["all_sizes"].map((size) => ProductColorOrSize.fromJson(size))),
        maxPrice: JsonUtils.parseNumFromJson(json["max_price"]),
        minPrice: JsonUtils.parseNumFromJson(json["min_price"]),
        itemStyle: List<String>.from(json["item_style"].map((x) => x)),
      );
}

class Category {
  final int id;
  final String name;
  final String image;
  final List<Category>? subCategories;
  final List<Category>? childCategories;

  Category({
    required this.id,
    required this.name,
    required this.image,
    this.subCategories,
    this.childCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        subCategories: json["sub_categories"] == null
            ? []
            : List<Category>.from(json["sub_categories"]!.map((x) => Category.fromJson(x))),
        childCategories: json["child_categories"] == null
            ? []
            : List<Category>.from(json["child_categories"]!.map((x) => Category.fromJson(x))),
      );
}

class Unit {
  final int id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic deletedAt;

  Unit({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        id: JsonUtils.parseIntFromJson(json["id"]),
        name: JsonUtils.parseStringFromJson(json["name"]),
        createdAt: JsonUtils.parseDatetimeFromJson(json["created_at"]),
        updatedAt: JsonUtils.parseDatetimeFromJson(json["updated_at"]),
        deletedAt: JsonUtils.parseDatetimeFromJson(json["deleted_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
