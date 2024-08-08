class SearchBody {
  String? name;
  String? color;
  String? size;
  int? categoryId;
  String? category;
  int? subCategoryId;
  String? subCategory;
  int? childCategoryId;
  String? childCategory;
  double? fromPrice;
  double? toPrice;
  double? rating;

  SearchBody({
    this.name,
    this.color,
    this.size,
    this.categoryId,
    this.category,
    this.subCategoryId,
    this.subCategory,
    this.childCategoryId,
    this.childCategory,
    this.fromPrice,
    this.toPrice,
    this.rating,
  });

  void copyWith({
    String? name,
    String? color,
    String? size,
    int? categoryId,
    String? category,
    int? subCategoryId,
    String? subCategory,
    int? childCategoryId,
    String? childCategory,
    double? fromPrice,
    double? toPrice,
    double? rating,
  }) {
    this.name = name ?? this.name;
    this.color = color ?? this.color;
    this.size = size ?? this.size;
    this.categoryId = categoryId ?? this.categoryId;
    this.category = category ?? this.category;
    this.subCategoryId = subCategoryId ?? this.subCategoryId;
    this.subCategory = subCategory ?? this.subCategory;
    this.childCategoryId = childCategoryId ?? this.childCategoryId;
    this.childCategory = childCategory ?? this.childCategory;
    this.fromPrice = fromPrice ?? this.fromPrice;
    this.toPrice = toPrice ?? this.toPrice;
    this.rating = rating ?? this.rating;
  }

  SearchBody copyNew(SearchBody searchBody) {
    return SearchBody(
      color: searchBody.color,
      rating: searchBody.rating,
      size: searchBody.size,
      categoryId: searchBody.categoryId,
      category: searchBody.category,
      subCategoryId: searchBody.subCategoryId,
      subCategory: searchBody.subCategory,
      childCategoryId: searchBody.childCategoryId,
      childCategory: searchBody.childCategory,
      fromPrice: searchBody.fromPrice,
      name: searchBody.name,
      toPrice: searchBody.toPrice,
    );
  }

  bool get noSearchCriteriaApplied =>
      name == null &&
      color == null &&
      size == null &&
      categoryId == null &&
      category == null &&
      subCategoryId == null &&
      subCategory == null &&
      childCategoryId == null &&
      childCategory == null &&
      fromPrice == null &&
      toPrice == null &&
      rating == null;

  Map<String, dynamic> toJson() {
    return {
      if (name != null) "name": name,
      if (color != null) "color": color,
      if (size != null) "size": size,
      if (category != null) "category": category,
      if (subCategory != null) "sub_category": subCategory,
      if (childCategory != null) "child_category": childCategory,
      if (fromPrice != null) "from_price": fromPrice,
      if (toPrice != null) "to_price": toPrice,
      if (rating != null) "rating": rating,
    };
  }
}
