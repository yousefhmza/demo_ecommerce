class ReviewBody {
  int? productId;
  int? rating;
  String? comment;

  ReviewBody({
    this.productId,
    this.rating,
    this.comment,
  });

  void copyWith({
    int? productId,
    int? rating,
    String? comment,
  }) {
    this.productId = productId ?? this.productId;
    this.rating = rating ?? this.rating;
    this.comment = comment ?? this.comment;
  }

  Map<String, dynamic> toJson() {
    return {
      if (productId != null) 'id': productId,
      if (rating != null) 'rating': rating,
      if (comment != null) 'comment': comment,
    };
  }
}
